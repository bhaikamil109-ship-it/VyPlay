import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/infrastructure/database/database.dart';
import 'package:vyplay/infrastructure/settings/setting_impl.dart';

void main() {
  late AppDatabase database;
  late SettingImpl settings;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    settings = SettingImpl(db: database);
  });

  tearDown(() async {
    await database.close();
  });

  Future<int> createGroup(String name, String profileName) async {
    final result = await settings.createSubscriptionGroup(
      groupName: name,
      profileName: profileName,
    );
    return result.fold(
      (failure) => throw StateError('Group creation failed: $failure'),
      (id) => id,
    );
  }

  Future<void> addSubscription(String id, String profileName, String name) {
    return database.upsertSubscription(
      SubscriptionsCompanion.insert(
        channelId: id,
        profileName: profileName,
        channelName: name,
      ),
    );
  }

  test('group members resolve subscriptions only from the owning profile',
      () async {
    await addSubscription('same-channel', 'personal', 'Personal channel');
    await addSubscription('same-channel', 'work', 'Work channel');
    final groupId = await createGroup('Favorites', 'personal');
    await database.addToGroup(groupId, 'same-channel', 'personal');

    final result = await settings.getGroupMembers(
      groupId: groupId,
      profileName: 'personal',
    );

    final members = result.fold(
      (failure) => throw StateError('Member read failed: $failure'),
      (value) => value,
    );
    expect(members, hasLength(1));
    expect(members.single['channelName'], 'Personal channel');
  });

  test('a different profile cannot rename or delete another profile group',
      () async {
    final groupId = await createGroup('Personal list', 'personal');

    final rename = await settings.renameSubscriptionGroup(
      groupId: groupId,
      newName: 'Tampered list',
      profileName: 'work',
    );
    final delete = await settings.deleteSubscriptionGroup(
      groupId: groupId,
      profileName: 'work',
    );

    expect(rename.fold((_) => true, (_) => false), isTrue);
    expect(delete.fold((_) => true, (_) => false), isTrue);
    final stored = await database.getGroupById(groupId);
    expect(stored?.groupName, 'Personal list');
    expect(stored?.profileName, 'personal');
  });

  test('a different profile cannot add/remove members or read group members',
      () async {
    await addSubscription('channel-1', 'personal', 'Personal channel');
    await addSubscription('channel-1', 'work', 'Work channel');
    final groupId = await createGroup('Personal list', 'personal');

    final add = await settings.addToGroup(
      groupId: groupId,
      channelId: 'channel-1',
      profileName: 'work',
    );
    final remove = await settings.removeFromGroup(
      groupId: groupId,
      channelId: 'channel-1',
      profileName: 'work',
    );
    final read = await settings.getGroupMembers(
      groupId: groupId,
      profileName: 'work',
    );

    expect(add.fold((_) => true, (_) => false), isTrue);
    expect(remove.fold((_) => true, (_) => false), isTrue);
    expect(read.fold((_) => true, (_) => false), isTrue);
    expect(await database.getGroupMembers(groupId, 'work'), isEmpty);
  });

  test('the owning profile can still manage its group members', () async {
    await addSubscription('channel-1', 'personal', 'Personal channel');
    final groupId = await createGroup('Personal list', 'personal');

    final add = await settings.addToGroup(
      groupId: groupId,
      channelId: 'channel-1',
      profileName: 'personal',
    );
    final members = await settings.getGroupMembers(
      groupId: groupId,
      profileName: 'personal',
    );

    expect(add.fold((_) => false, (value) => value), isTrue);
    expect(
      members.fold((_) => <Map<String, dynamic>>[], (value) => value),
      hasLength(1),
    );
  });
}

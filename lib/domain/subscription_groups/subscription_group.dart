import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_group.freezed.dart';
part 'subscription_group.g.dart';

@freezed
sealed class SubscriptionGroup with _$SubscriptionGroup {
  const factory SubscriptionGroup({
    required int id,
    required String groupName,
    String? colorHex,
    required int sortOrder,
    required String profileName,
    @Default([]) List<String> memberChannelIds,
  }) = _SubscriptionGroup;

  factory SubscriptionGroup.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupFromJson(json);
}

@freezed
sealed class SubscriptionGroupMember with _$SubscriptionGroupMember {
  const factory SubscriptionGroupMember({
    required int groupId,
    required String channelId,
    required String profileName,
  }) = _SubscriptionGroupMember;

  factory SubscriptionGroupMember.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupMemberFromJson(json);
}

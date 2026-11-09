// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionGroup _$SubscriptionGroupFromJson(Map<String, dynamic> json) =>
    _SubscriptionGroup(
      id: (json['id'] as num).toInt(),
      groupName: json['groupName'] as String,
      colorHex: json['colorHex'] as String?,
      sortOrder: (json['sortOrder'] as num).toInt(),
      profileName: json['profileName'] as String,
      memberChannelIds: (json['memberChannelIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubscriptionGroupToJson(_SubscriptionGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'colorHex': instance.colorHex,
      'sortOrder': instance.sortOrder,
      'profileName': instance.profileName,
      'memberChannelIds': instance.memberChannelIds,
    };

_SubscriptionGroupMember _$SubscriptionGroupMemberFromJson(
        Map<String, dynamic> json) =>
    _SubscriptionGroupMember(
      groupId: (json['groupId'] as num).toInt(),
      channelId: json['channelId'] as String,
      profileName: json['profileName'] as String,
    );

Map<String, dynamic> _$SubscriptionGroupMemberToJson(
        _SubscriptionGroupMember instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'channelId': instance.channelId,
      'profileName': instance.profileName,
    };

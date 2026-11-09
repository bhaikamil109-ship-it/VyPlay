// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageThumbnail _$ImageThumbnailFromJson(Map<String, dynamic> json) =>
    _ImageThumbnail(
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      quality: json['quality'] as String?,
    );

Map<String, dynamic> _$ImageThumbnailToJson(_ImageThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'quality': instance.quality,
    };

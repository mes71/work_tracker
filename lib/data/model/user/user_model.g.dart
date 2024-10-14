// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      refToken: json['refToken'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'refToken': instance.refToken,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };

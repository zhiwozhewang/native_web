// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redirectornot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Redirectornot _$RedirectornotFromJson(Map<String, dynamic> json) =>
    Redirectornot()
      ..code = json['code'] as num
      ..msg = json['msg'] as String
      ..data = json['data'] as String
      ..now = json['now'] as num;

Map<String, dynamic> _$RedirectornotToJson(Redirectornot instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
      'now': instance.now,
    };

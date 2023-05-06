// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decodedata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Decodedata _$DecodedataFromJson(Map<String, dynamic> json) => Decodedata()
  ..name = json['name'] as String
  ..wapurl = json['wapurl'] as String
  ..iswap = json['iswap'] as num
  ..splash = json['splash'] as String
  ..downurl = json['downurl'] as String
  ..version = json['version'] as num;

Map<String, dynamic> _$DecodedataToJson(Decodedata instance) =>
    <String, dynamic>{
      'name': instance.name,
      'wapurl': instance.wapurl,
      'iswap': instance.iswap,
      'splash': instance.splash,
      'downurl': instance.downurl,
      'version': instance.version,
    };

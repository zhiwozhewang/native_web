import 'package:json_annotation/json_annotation.dart';

part 'decodedata.g.dart';

@JsonSerializable()
class Decodedata {
  Decodedata();

  late String name;
  late String wapurl;
  late num iswap;
  late String splash;
  late String downurl;
  late num version;
  
  factory Decodedata.fromJson(Map<String,dynamic> json) => _$DecodedataFromJson(json);
  Map<String, dynamic> toJson() => _$DecodedataToJson(this);
}

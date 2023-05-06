import 'package:json_annotation/json_annotation.dart';

part 'redirectornot.g.dart';

@JsonSerializable()
class Redirectornot {
  Redirectornot();

  late num code;
  late String msg;
  late String data;
  late num now;
  
  factory Redirectornot.fromJson(Map<String,dynamic> json) => _$RedirectornotFromJson(json);
  Map<String, dynamic> toJson() => _$RedirectornotToJson(this);
}

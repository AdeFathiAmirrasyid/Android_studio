import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Data(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});
// map -> model
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  // model -> map
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

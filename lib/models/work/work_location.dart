import 'package:json_annotation/json_annotation.dart';
part 'work_location.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.snake, includeIfNull: false)
class WorkLocation {
  WorkLocation({
    this.id,
    this.name,
    this.code,
    this.address,
    this.phoneNo,
    this.radius,
    this.coordinate,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? code;
  String? address;
  String? phoneNo;
  double? radius;
  String? coordinate;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WorkLocation.fromJson(Map<String, dynamic> json) =>
      _$WorkLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WorkLocationToJson(this);
}

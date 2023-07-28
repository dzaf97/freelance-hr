import 'package:json_annotation/json_annotation.dart';
part 'attendance_location.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AttendanceLocation {
  AttendanceLocation({
    required this.id,
    required this.code,
    required this.location,
    required this.address,
    required this.maximumRadius,
    required this.coordinate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String code;
  String location;
  String address;
  double maximumRadius;
  String coordinate;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory AttendanceLocation.fromJson(Map<String, dynamic> json) =>
      _$AttendanceLocationFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceLocationToJson(this);
}

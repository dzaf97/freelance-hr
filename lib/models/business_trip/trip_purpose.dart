import 'package:json_annotation/json_annotation.dart';
part 'trip_purpose.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TripPurpose {
  TripPurpose({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory TripPurpose.fromJson(Map<String, dynamic> json) =>
      _$TripPurposeFromJson(json);
}

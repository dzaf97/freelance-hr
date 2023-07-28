import 'package:json_annotation/json_annotation.dart';
part 'shift_daily.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ShiftDaily {
  ShiftDaily({
    required this.id,
    required this.shiftName,
    this.startTime,
    this.endTime,
    this.hours,
    this.color,
    this.graceForLate,
    this.earlyIn,
    this.lateIn,
    this.earlyOut,
    this.lateOut,
    this.isWfh,
    this.isFlexible,
    this.overtimeTypeId,
    this.overtimeStartTime,
    this.overtimeEndTime,
    this.requirePhoto,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String shiftName;
  String? startTime;
  String? endTime;
  num? hours;
  String? color;
  int? graceForLate;
  int? earlyIn;
  int? lateIn;
  int? earlyOut;
  int? lateOut;
  int? isWfh;
  int? isFlexible;
  int? overtimeTypeId;
  String? overtimeStartTime;
  String? overtimeEndTime;
  int? requirePhoto;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ShiftDaily.fromJson(Map<String, dynamic> json) => _$ShiftDailyFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftDailyToJson(this);
}

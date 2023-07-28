import 'package:json_annotation/json_annotation.dart';
part 'leave_type.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LeaveType {
  LeaveType({
    this.id,
    this.type,
    this.code,
    this.daysEntitled,
    this.daysCount,
    this.applyBefore,
    this.dayType,
    this.firstHalfCode,
    this.secondHalfCode,
    this.gracePeriod,
    this.additionalStatus,
    this.enableMinus,
    this.applyToAll,
    this.isCarriedOver,
    this.carriedOverType,
    this.limitCarriedOver,
    this.maxCarriedOver,
    this.carriedOverExpired,
    this.attachDocument,
    this.isProrated,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  num? id;
  String? type;
  String? code;
  num? daysEntitled;
  String? daysCount;
  num? applyBefore;
  String? dayType;
  String? firstHalfCode;
  String? secondHalfCode;
  num? gracePeriod;
  dynamic additionalStatus;
  num? enableMinus;
  num? applyToAll;
  num? isCarriedOver;
  String? carriedOverType;
  num? limitCarriedOver;
  num? maxCarriedOver;
  num? carriedOverExpired;
  num? attachDocument;
  num? isProrated;
  num? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Pivot {
  Pivot({
    this.userId,
    this.leaveTypeId,
    this.startValidDate,
    this.endValidDate,
    this.nextValidDate,
    this.entitled,
    this.proportional,
    this.bringFoward,
    this.forfeited,
    this.adjustment,
    this.used,
    this.remaining,
  });

  num? userId;
  num? leaveTypeId;
  DateTime? startValidDate;
  DateTime? endValidDate;
  DateTime? nextValidDate;
  num? entitled;
  dynamic proportional;
  num? bringFoward;
  dynamic forfeited;
  dynamic adjustment;
  dynamic used;
  num? remaining;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

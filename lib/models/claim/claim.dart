import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/claim/claim_category.dart';
part 'claim.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Claim {
  Claim({
    this.success,
    this.message,
    this.id,
    this.userId,
    this.approverId,
    this.claimCategoryId,
    this.claimTypeId,
    this.date,
    this.dateTo,
    this.submissionDate,
    this.approvalDate,
    this.title,
    this.remarks,
    this.attachmentPath,
    this.approvalRemarks,
    this.status,
    this.amountClaimed,
    this.amountApproved,
    this.typeAmount,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.type,
  });

  bool? success;
  List<String>? message;
  int? id;
  int? userId;
  dynamic approverId;

  @ToIntConverter()
  int? claimCategoryId;
  @ToIntConverter()
  int? claimTypeId;
  DateTime? date;
  DateTime? dateTo;
  DateTime? submissionDate;
  DateTime? approvalDate;
  String? title;
  String? remarks;
  String? attachmentPath;
  String? approvalRemarks;
  String? status;
  @ToIntConverter()
  int? amountClaimed;
  @ToIntConverter()
  int? amountApproved;
  @ToIntConverter()
  int? typeAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;
  Type? type;

  factory Claim.fromJson(Map<String, dynamic> json) => _$ClaimFromJson(json);
  Map<String, dynamic> toJson() => _$ClaimToJson(this);
}

class ToIntConverter implements JsonConverter<int, dynamic> {
  const ToIntConverter();

  @override
  fromJson(json) {
    if (json.runtimeType == String) {
      return num.parse(json).toInt();
    } else if (json.runtimeType == int) {
      return json;
    } else if (json.runtimeType == double) {
      return (json as double).toInt();
    } else {
      return 0;
    }
  }

  @override
  toJson(object) => object;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Type {
  Type({
    required this.id,
    this.claimCategoryId,
    required this.code,
    required this.type,
    this.limitAmount,
    this.limitType,
    this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.displayLimit,
  });

  int id;
  @JsonKey(includeIfNull: false)
  int? claimCategoryId;
  String code;
  String type;
  @JsonKey(includeIfNull: false)
  num? limitAmount;
  String? limitType;
  @JsonKey(includeIfNull: false)
  int? isActive;
  dynamic createdAt;
  dynamic updatedAt;
  @JsonKey(includeIfNull: false)
  num? displayLimit;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

/*  
-  [ENDPOINT] '/claim-type'
-  [TYPE] Response
-  [METHOD] GET
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/claim/claim_category.dart';
part 'claim_type.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ClaimType {
  ClaimType({
    required this.id,
    required this.claimCategoryId,
    required this.code,
    required this.type,
    required this.limitAmount,
    required this.limitType,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    required this.displayLimit,
    required this.used,
    required this.balance,
    required this.pivot,
    required this.category,
  });

  int id;
  int claimCategoryId;
  String code;
  String type;
  num limitAmount;
  String limitType;
  int isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  num displayLimit;
  num used;
  num balance;
  Pivot pivot;
  Category category;

  factory ClaimType.fromJson(Map<String, dynamic> json) =>
      _$ClaimTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimTypeToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Pivot {
  Pivot({
    required this.userId,
    required this.claimTypeId,
  });

  int userId;
  int claimTypeId;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

/*  
-  [ENDPOINT] '/claim'
-  [TYPE] Request
-  [METHOD] POST
*/

import 'package:json_annotation/json_annotation.dart';
part 'claim_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ClaimRequest {
  ClaimRequest({
    this.id,
    this.claimCategoryId,
    this.claimTypeId,
    this.date,
    this.remarks,
    this.title,
    this.amountClaimed,
    this.file,
    this.status,
  });

  String? id;
  String? claimCategoryId;
  String? claimTypeId;
  String? date;
  String? remarks;
  String? title;
  String? amountClaimed;
  String? file;
  String? status;

  factory ClaimRequest.fromJson(Map<String, dynamic> json) =>
      _$ClaimRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimRequestToJson(this);

  bool validate() {
    for (var element in toJson().entries) {
      if (element.key == "file") continue;
      if (element.value == "") return false;
    }
    return true;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ClaimResponse {
  ClaimResponse({
    this.claimCategoryId,
    this.claimTypeId,
    this.date,
    this.remarks,
    this.title,
    this.amountClaimed,
    this.userId,
    this.attachmentPath,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.message,
    this.success,
  });

  String? claimCategoryId;
  String? claimTypeId;
  DateTime? date;
  String? remarks;
  String? title;
  String? amountClaimed;
  int? userId;
  String? attachmentPath;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  @JsonKey(ignore: true)
  List<dynamic>? message;
  @JsonKey(ignore: true)
  bool? success;

  factory ClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimResponseToJson(this);
}

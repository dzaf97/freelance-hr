// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimRequest _$ClaimRequestFromJson(Map<String, dynamic> json) => ClaimRequest(
      id: json['id'] as String?,
      claimCategoryId: json['claim_category_id'] as String?,
      claimTypeId: json['claim_type_id'] as String?,
      date: json['date'] as String?,
      remarks: json['remarks'] as String?,
      title: json['title'] as String?,
      amountClaimed: json['amount_claimed'] as String?,
      file: json['file'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ClaimRequestToJson(ClaimRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('claim_category_id', instance.claimCategoryId);
  writeNotNull('claim_type_id', instance.claimTypeId);
  writeNotNull('date', instance.date);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('title', instance.title);
  writeNotNull('amount_claimed', instance.amountClaimed);
  writeNotNull('file', instance.file);
  writeNotNull('status', instance.status);
  return val;
}

ClaimResponse _$ClaimResponseFromJson(Map<String, dynamic> json) =>
    ClaimResponse(
      claimCategoryId: json['claim_category_id'] as String?,
      claimTypeId: json['claim_type_id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      remarks: json['remarks'] as String?,
      title: json['title'] as String?,
      amountClaimed: json['amount_claimed'] as String?,
      userId: json['user_id'] as int?,
      attachmentPath: json['attachment_path'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ClaimResponseToJson(ClaimResponse instance) =>
    <String, dynamic>{
      'claim_category_id': instance.claimCategoryId,
      'claim_type_id': instance.claimTypeId,
      'date': instance.date?.toIso8601String(),
      'remarks': instance.remarks,
      'title': instance.title,
      'amount_claimed': instance.amountClaimed,
      'user_id': instance.userId,
      'attachment_path': instance.attachmentPath,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Claim _$ClaimFromJson(Map<String, dynamic> json) => Claim(
      success: json['success'] as bool?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      approverId: json['approver_id'],
      claimCategoryId:
          const ToIntConverter().fromJson(json['claim_category_id']),
      claimTypeId: const ToIntConverter().fromJson(json['claim_type_id']),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dateTo: json['date_to'] == null
          ? null
          : DateTime.parse(json['date_to'] as String),
      submissionDate: json['submission_date'] == null
          ? null
          : DateTime.parse(json['submission_date'] as String),
      approvalDate: json['approval_date'] == null
          ? null
          : DateTime.parse(json['approval_date'] as String),
      title: json['title'] as String?,
      remarks: json['remarks'] as String?,
      attachmentPath: json['attachment_path'] as String?,
      approvalRemarks: json['approval_remarks'] as String?,
      status: json['status'] as String?,
      amountClaimed: const ToIntConverter().fromJson(json['amount_claimed']),
      amountApproved: const ToIntConverter().fromJson(json['amount_approved']),
      typeAmount: const ToIntConverter().fromJson(json['type_amount']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClaimToJson(Claim instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'id': instance.id,
      'user_id': instance.userId,
      'approver_id': instance.approverId,
      'claim_category_id': _$JsonConverterToJson<dynamic, int>(
          instance.claimCategoryId, const ToIntConverter().toJson),
      'claim_type_id': _$JsonConverterToJson<dynamic, int>(
          instance.claimTypeId, const ToIntConverter().toJson),
      'date': instance.date?.toIso8601String(),
      'date_to': instance.dateTo?.toIso8601String(),
      'submission_date': instance.submissionDate?.toIso8601String(),
      'approval_date': instance.approvalDate?.toIso8601String(),
      'title': instance.title,
      'remarks': instance.remarks,
      'attachment_path': instance.attachmentPath,
      'approval_remarks': instance.approvalRemarks,
      'status': instance.status,
      'amount_claimed': _$JsonConverterToJson<dynamic, int>(
          instance.amountClaimed, const ToIntConverter().toJson),
      'amount_approved': _$JsonConverterToJson<dynamic, int>(
          instance.amountApproved, const ToIntConverter().toJson),
      'type_amount': _$JsonConverterToJson<dynamic, int>(
          instance.typeAmount, const ToIntConverter().toJson),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'category': instance.category?.toJson(),
      'type': instance.type?.toJson(),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: json['id'] as int,
      claimCategoryId: json['claim_category_id'] as int?,
      code: json['code'] as String,
      type: json['type'] as String,
      limitAmount: json['limit_amount'] as num?,
      limitType: json['limit_type'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      displayLimit: json['display_limit'] as num?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('claim_category_id', instance.claimCategoryId);
  val['code'] = instance.code;
  val['type'] = instance.type;
  writeNotNull('limit_amount', instance.limitAmount);
  val['limit_type'] = instance.limitType;
  writeNotNull('is_active', instance.isActive);
  val['created_at'] = instance.createdAt;
  val['updated_at'] = instance.updatedAt;
  writeNotNull('display_limit', instance.displayLimit);
  return val;
}

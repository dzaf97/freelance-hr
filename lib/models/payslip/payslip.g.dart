// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payslip _$PayslipFromJson(Map<String, dynamic> json) => Payslip(
      id: json['id'] as int,
      paymentId: json['payment_id'] as int,
      userId: json['user_id'] as int,
      name: json['name'] as String,
      attachmentPath: json['attachment_path'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayslipToJson(Payslip instance) => <String, dynamic>{
      'id': instance.id,
      'payment_id': instance.paymentId,
      'user_id': instance.userId,
      'name': instance.name,
      'attachment_path': instance.attachmentPath,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'payment': instance.payment.toJson(),
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      data: json['data'],
      companyName: json['company_name'] as String,
      description: json['description'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      contactNo: json['contact_no'] as String?,
      zipCode: json['zip_code'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      plan: json['plan'],
      locale: json['locale'],
      logoPath: json['logo_path'] as String?,
      picName: json['pic_name'],
      picEmail: json['pic_email'],
      status: json['status'],
      city: json['city'] as String?,
      file: json['file'] as List<dynamic>?,
      decription: json['decription'] as String?,
      tenancyDbName: json['tenancy_db_name'] as String?,
      domains: (json['domains'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'data': instance.data,
      'company_name': instance.companyName,
      'description': instance.description,
      'address1': instance.address1,
      'address2': instance.address2,
      'contact_no': instance.contactNo,
      'zip_code': instance.zipCode,
      'state': instance.state,
      'country': instance.country,
      'plan': instance.plan,
      'locale': instance.locale,
      'logo_path': instance.logoPath,
      'pic_name': instance.picName,
      'pic_email': instance.picEmail,
      'status': instance.status,
      'city': instance.city,
      'file': instance.file,
      'decription': instance.decription,
      'tenancy_db_name': instance.tenancyDbName,
      'domains': instance.domains?.map((e) => e?.toJson()).toList(),
    };

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      id: json['id'] as int,
      domain: json['domain'] as String,
      tenantId: json['tenant_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'id': instance.id,
      'domain': instance.domain,
      'tenant_id': instance.tenantId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

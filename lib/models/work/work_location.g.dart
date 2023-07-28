// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkLocation _$WorkLocationFromJson(Map<String, dynamic> json) => WorkLocation(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      address: json['address'] as String?,
      phoneNo: json['phone_no'] as String?,
      radius: (json['radius'] as num?)?.toDouble(),
      coordinate: json['coordinate'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkLocationToJson(WorkLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('address', instance.address);
  writeNotNull('phone_no', instance.phoneNo);
  writeNotNull('radius', instance.radius);
  writeNotNull('coordinate', instance.coordinate);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  return val;
}

import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Company {
  Company({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.data,
    required this.companyName,
    this.description,
    this.address1,
    this.address2,
    this.contactNo,
    this.zipCode,
    this.state,
    this.country,
    this.plan,
    this.locale,
    this.logoPath,
    this.picName,
    this.picEmail,
    this.status,
    this.city,
    this.file,
    this.decription,
    this.tenancyDbName,
    this.domains,
  });

  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic data;
  String companyName;
  String? description;
  String? address1;
  String? address2;
  String? contactNo;
  String? zipCode;
  String? state;
  String? country;
  dynamic plan;
  dynamic locale;
  String? logoPath;
  dynamic picName;
  dynamic picEmail;
  dynamic status;
  String? city;
  List<dynamic>? file;
  String? decription;
  String? tenancyDbName;
  List<Domain?>? domains;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Domain {
  Domain({
    required this.id,
    required this.domain,
    required this.tenantId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String domain;
  String tenantId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  Map<String, dynamic> toJson() => _$DomainToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'payslip.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Payslip {
  Payslip({
    required this.id,
    required this.paymentId,
    required this.userId,
    required this.name,
    required this.attachmentPath,
    required this.createdAt,
    required this.updatedAt,
    required this.payment,
  });

  int id;
  int paymentId;
  int userId;
  String name;
  String attachmentPath;
  DateTime createdAt;
  DateTime updatedAt;
  Payment payment;

  factory Payslip.fromJson(Map<String, dynamic> json) =>
      _$PayslipFromJson(json);
  Map<String, dynamic> toJson() => _$PayslipToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Payment {
  Payment({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

import 'package:flutter/foundation.dart';

@immutable
class EmployeeModel {
  final String? code;
  final String? name;
  final String? fathersName;
  final String? designation;
  final String? status;
  final String? joinedDate;
  final String? email;
  final String? phone;
  final String? cnic;
  final String? address;
  final String? bankName;
  final String? bankAccount;
  final String? basicSalary;
  final String? allowances;
  final String? deductions;

  const EmployeeModel({
    this.code,
    this.name,
    this.fathersName,
    this.designation,
    this.status,
    this.joinedDate,
    this.email,
    this.phone,
    this.cnic,
    this.address,
    this.bankName,
    this.bankAccount,
    this.basicSalary,
    this.allowances,
    this.deductions,
  });
}
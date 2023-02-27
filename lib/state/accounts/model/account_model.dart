import 'package:flutter/foundation.dart';

@immutable
class AccountModel {
  final int? id;
  final num? balance;
  final String? corporateName;
  final int? cardVoucher;
  final int? itemPackage;

  const AccountModel({
    this.id,
    this.balance,
    this.cardVoucher,
    this.corporateName,
    this.itemPackage,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      balance: json['balance'],
      cardVoucher: json['cardVoucher'],
      corporateName: json['corporateName'],
      itemPackage: json['itemPackage'],
    );
  }
}

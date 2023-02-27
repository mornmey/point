import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/colors.dart';

class LanguageCode {
  static const KH_CODE = "km";
  static const EN_CODE = "en";
}

class User {
  User({
    this.id,
    this.name,
    this.nameKh,
    this.primaryPhone,
    this.secondPhone,
    this.password,
    this.sex,
    this.dateOfBirth,
  });

  int? id;
  String? name;
  String? nameKh;
  String? primaryPhone;
  String? secondPhone;
  String? password;
  String? sex;
  DateTime? dateOfBirth;

  User copyWith({
    int? id,
    String? name,
    String? nameKh,
    String? primaryPhone,
    String? secondPhone,
    String? password,
    String? sex,
    DateTime? dateOfBirth,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        nameKh: nameKh ?? this.nameKh,
        primaryPhone: primaryPhone ?? this.primaryPhone,
        secondPhone: secondPhone ?? this.secondPhone,
        password: password ?? this.password,
        sex: sex ?? this.sex,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        nameKh: json["name_kh"],
        primaryPhone: json["primary_phone"],
        secondPhone: json["second_phone"],
        password: json["password"],
        sex: json["sex"],
        dateOfBirth: json["date_of_birth"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_kh": nameKh,
        "primary_phone": primaryPhone,
        "second_phone": secondPhone,
        "password": password,
        "sex": sex,
        "date_of_birth": dateOfBirth,
      };
}

/// TODO: Delete
class Transaction {
  String? title;
  String? dateTime;
  String? fee;
  bool? isIncome;

  Transaction({
    this.title,
    this.dateTime,
    this.fee,
    this.isIncome = true,
  });
}

class Status {
  String? title;
  Color? backgroundColor;

  Status({this.title, this.backgroundColor});
}

class Dashboard {
  Color? backgroundColor;
  Color? trailingBackgroundColor;
  IconData? icons;
  String? title;
  String? trailing;

  Dashboard({
    this.title,
    this.backgroundColor,
    this.trailingBackgroundColor,
    this.icons,
    this.trailing,
  });
}

class CardItem {
  String? img;

  CardItem({
    this.img,
  });
}

class OrderItem {
  String? img;
  String? title;
  String? qty;
  String? price;
  String? point;
  OrderItem({
    this.img,
    this.title,
    this.qty,
    this.price,
    this.point,
  });
}

class Voucher {
  String? name;
  double? amount;
  int? discount;
  DateTime? expiryDate;
  String? description;
  Color? color;

  Voucher({
    this.name,
    this.discount,
    this.amount,
    this.description,
    this.expiryDate,
    this.color,
  });
}

/// TODO: Delete
List<Transaction> transactionData = [
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 31/01/2023",
    fee: "+200",
    isIncome: true,
  ),
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 31/01/2023",
    fee: "+200",
    isIncome: true,
  ),
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 31/01/2023",
    fee: "+200",
    isIncome: true,
  ),
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 31/01/2023",
    fee: "+200",
    isIncome: true,
  ),
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 03/02/2023",
    fee: "-200",
    isIncome: false,
  ),
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 03/02/2023",
    fee: "-200",
    isIncome: false,
  ),
  Transaction(
    title: "Electricity Payment",
    dateTime: "10:40 03/02/2023",
    fee: "-200",
    isIncome: false,
  ),
];

List<Status> statusData = [
  Status(
    title: "😇 Away",
    backgroundColor: AppColorSets.backgroundBlackColor,
  ),
  Status(
    title: "🎧 Music",
    backgroundColor: AppColorSets.backgroundGreenColor,
  ),
  Status(
    title: "💻 At Work",
    backgroundColor: AppColorSets.backgroundOrangeColor,
  ),
  Status(
    title: "🎮 Games",
    backgroundColor: AppColorSets.backgroundDarkOrangeColor,
  ),
];

List<Dashboard> dashboardData = [
  Dashboard(
    title: "Payments",
    trailing: "2 New",
  ),
  Dashboard(
    backgroundColor: AppColorSets.backgroundOrangeColor,
    trailingBackgroundColor: AppColorSets.backgroundBlueColor,
    icons: FontAwesomeIcons.award,
    title: "Achievement",
  ),
  Dashboard(
    backgroundColor: AppColorSets.backgroundLightBlueColor,
    trailingBackgroundColor: AppColorSets.backgroundDarkOrangeColor,
    icons: FontAwesomeIcons.circleCheck,
    title: "Privacy",
    trailing: "Actions Needed",
  ),
];

List<CardItem> cardItem = [
  CardItem(
    img:
        "https://play-lh.googleusercontent.com/BMryS7Cn454jIAVrchF9as-7WOG07H97Lugr62ISdJSo7wj1cC-0MTUm3SqSZffc7IQ",
  ),
  CardItem(
    img:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJAGLrzySPmKEZT__NyhzoGcRhBQPCDFpkuPaMI5Qzx9Xk1QY0xNohDyE7QIc9ZHvoXsQ&usqp=CAU",
  ),
  CardItem(
    img:
        "https://play-lh.googleusercontent.com/BMryS7Cn454jIAVrchF9as-7WOG07H97Lugr62ISdJSo7wj1cC-0MTUm3SqSZffc7IQ",
  ),
  CardItem(
    img:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJAGLrzySPmKEZT__NyhzoGcRhBQPCDFpkuPaMI5Qzx9Xk1QY0xNohDyE7QIc9ZHvoXsQ&usqp=CAU",
  ),
  CardItem(
    img:
        "https://play-lh.googleusercontent.com/BMryS7Cn454jIAVrchF9as-7WOG07H97Lugr62ISdJSo7wj1cC-0MTUm3SqSZffc7IQ",
  ),
  CardItem(
    img:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJAGLrzySPmKEZT__NyhzoGcRhBQPCDFpkuPaMI5Qzx9Xk1QY0xNohDyE7QIc9ZHvoXsQ&usqp=CAU",
  ),
];

List<OrderItem> orderItem = [
  OrderItem(
    img:
        "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
    title: "Food & Drink",
    qty: "1",
    price: "2.00",
    point: "20",
  ),
  OrderItem(
    img:
        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20191120-blackberry-virgin-mojito-delish-ehg-4719-1583519572.jpg?crop=0.668xw:1.00xh;0.0929xw,0&resize=1200:*",
    title: "Food & Drink",
    price: "2.00",
    point: "30",
  ),
  OrderItem(
    img:
        "https://media.architecturaldigest.com/photos/62d6ea4812a1dee9ae761fec/master/pass/7-19%20best%20canned%20drinks%20(1).jpg",
    title: "Food & Drink",
    qty: "3",
    price: "2.00",
    point: "40",
  ),
];

List<Voucher> cardVoucher = [
  Voucher(
    name: "Nescafe",
    description: "Caffe Mocha",
    amount: 1.29,
    expiryDate: DateTime.now(),
    color: AppColorSets.backgroundGreenColor,
  ),
  Voucher(
    name: "Nes-quick",
    description: "Chocolate",
    discount: 20,
    expiryDate: DateTime.now(),
    color: AppColorSets.backgroundBlueColor,
  ),
  Voucher(
    name: "Nivea",
    description: "Creame Care",
    amount: 5.42,
    expiryDate: DateTime.now(),
    color: AppColorSets.backgroundOrangeColor,
  ),
];

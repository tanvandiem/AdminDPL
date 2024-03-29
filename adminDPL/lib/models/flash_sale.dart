import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlashSale {
  String? id;
  Timestamp? releasedDate;
  Timestamp? expDate;
  int? discountPercent;
  String? coverImage;
  String? name;
  FlashSale(
      {this.id,
      this.discountPercent,
      this.expDate,
      this.releasedDate,
      this.coverImage,
      this.name}) {
    id ??= Uuid().v4();
  }
  factory FlashSale.fromJson(Map<String, dynamic> json) {
    return FlashSale(
        releasedDate: json['releasedDate'],
        id: json['id'],
        expDate: json['expDate'],
        discountPercent: json['discountPercent'],
        coverImage: json['coverImage'],
        name: json['name']);
  }
  Map<String, dynamic> toJson() => {
        'discountPercent': discountPercent,
        'id': id,
        'releasedDate': releasedDate,
        'expDate': expDate,
        'coverImage': coverImage,
        'name': name
      };
}

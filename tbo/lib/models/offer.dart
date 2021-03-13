import 'dart:convert';

import 'package:tbo/api_service/api_service.dart';
import 'package:tbo/models/parameter.dart';

class Offer {
  final int id;
  final int categoryId;
  final String description;
  final String model;
  final DateTime modifiedTime; // since 1970.01.01
  final String name;
  final double oldPrice;
  final double price;
  final List<String> picturesUrl;
  final List<Parameter> params;
  final String salesNotes;
  final String url;
  final String vendor;
  final String vendorCode;

  Offer(
    this.id,
    this.categoryId,
    this.description,
    this.model,
    this.modifiedTime,
    this.name,
    this.picturesUrl,
    this.params,
    this.price,
    this.salesNotes,
    this.url,
    this.vendor,
    this.vendorCode, {
    this.oldPrice,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    var paramObjsJson = json['params'] as List;
    List<Parameter> _params = paramObjsJson
        .map((paramJson) => Parameter.fromJson(paramJson))
        .toList();
    var priceObjsJson = json['price'] as List;

    List<String> _picturesUrl =
        (jsonEncode(priceObjsJson) as List<dynamic>).cast<String>();
    // List<String> _price = priceObjsJson
    //     .map((priceJson) => String. fromJson(priceJson))
    //     .toList();

    return Offer(
      json['id'],
      json['categoryId'],
      json['description'],
      json['model'],
      json['modified_time'],
      json['name'],
      _picturesUrl, //как
      _params,
      json['price'],
      json['sales_notes'],
      json['url'],
      json['vendor'],
      json['vendorCode'], oldPrice: json['oldprice'],
    ); //по-другому
  }
}

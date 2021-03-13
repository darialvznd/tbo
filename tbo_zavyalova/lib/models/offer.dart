import 'dart:convert';

import 'package:tbo_zavyalova/models/parameter.dart';

class Offer {
  final int id;
  final int categoryId;
  final String description;
  final String model;
  final DateTime modifiedTime; // since 1970.01.01
  final String name;
  final int oldPrice;
  final int price;
  final List<String> picturesUrl;
  final List<Parameter> params;
  final String salesNotes;
  final String url;
  final String vendor;
  final String vendorCode;

  Offer({
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
    this.vendorCode,
    this.oldPrice,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    var paramObjsJson = json['params'] as List;
    List<Parameter> _params = paramObjsJson
        .map((paramJson) => Parameter.fromJson(paramJson))
        .toList();
    var picturesObjsJson = json['pictures'] as List;
    List<String> _picturesUrl = picturesObjsJson.map((e) => e.toString()).toList();

    // List<String> _picturesUrl =
    //     (jsonEncode(priceObjsJson) as List<dynamic>).cast<String>();

    return Offer(
      name: json['name'],
      id: int.parse(json['id']), categoryId: json['categoryId'],
      description: json['description'],
      model: json['model'],
      modifiedTime: DateTime.fromMicrosecondsSinceEpoch(json['modified_time']),

      picturesUrl: _picturesUrl, //как
      params: _params,
      price: json['price'],
      salesNotes: json['sales_notes'],
      url: json['url'].toString(),
      vendor: json['vendor'],
      vendorCode: json['vendorCode'], oldPrice: json['oldprice'],
    ); //по-другому
  }
}

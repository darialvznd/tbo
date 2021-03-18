import 'dart:convert';
import 'package:tbo_zavyalova/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/get_it.dart';
import 'package:tbo_zavyalova/models/parameter.dart';
import 'package:tbo_zavyalova/repositories/category_repository.dart';

class Offer {
  final String id;
  final String categoryName;
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
  final String currency;
  Offer({
    this.currency,
    this.id,
    this.categoryName,
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
    CategoryRepository _categories = getIt();
    var paramObjsJson = json['params'] as List;
    List<Parameter> _params = paramObjsJson
        .map((paramJson) => Parameter.fromJson(paramJson))
        .toList();
    var picturesObjsJson = json['pictures'] as List;
    List<String> _picturesUrl =
        picturesObjsJson.map((e) => e.toString()).toList();

    String categoryName = _categories.findWhere(json['categoryId']);

    // String categoryName =
    //  "Заменить категорию";

    return Offer(
      name: json['name'],
      id: json['id'], categoryName: categoryName,
      description: json['description'],
      model: json['model'],
      modifiedTime: DateTime.fromMicrosecondsSinceEpoch(json['modified_time']),
      currency: json['currency'],
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

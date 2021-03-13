import 'dart:convert';
import 'dart:io';

import 'package:tbo/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:tbo/models/offer.dart';

class ApiService {
  static final String url = 'http://server.getoutfit.ru';

  static Future<List<Offer>> getOffers() async {
    var response = await http.get(url + '/offers');
    List<Offer> offers = [];
    for (var item in json.decode(response.body)) {
      offers.add(Offer.fromJson(item));
    }
    return offers;
  }

  static Future<List<Category>> getCategories() async {
    var response = await http.get(url + '/categories');
    List<Category> categories = [];
    for (var item in json.decode(response.body)) {
      categories.add(Category.fromJson(item));
    }
    return categories;
  }
}

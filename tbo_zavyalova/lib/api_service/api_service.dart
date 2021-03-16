import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tbo_zavyalova/models/category.dart';
import 'package:tbo_zavyalova/models/offer.dart';

class ApiService {
  static final String url = 'http://server.getoutfit.ru';

  static Future<List<Offer>> getOffers() async {
    var response = await http.get(url + '/offers');
    List<Offer> offers = [];
    String source = Utf8Decoder().convert(response.bodyBytes);
    for (var item in json.decode(source)) {
      offers.add(Offer.fromJson(item));
    }
    return offers;
  }

  static Future<List<Offer>> getOffersFromPage(
    int page,
  ) async {
    int value = page * 6;
    var response = await http.get(url + '/offers?from=${value}&limit=6');
    List<Offer> offers = [];
    String source = Utf8Decoder().convert(response.bodyBytes);
    for (var item in json.decode(source)) {
      offers.add(Offer.fromJson(item));
    }
    return offers;
  }

  static Future<List<Offer>> findOffersByWord(String term, int page) async {
    List<Offer> offers = [];
    int value = page * 6;
    List<String> parametersName = ['name', 'vendor', 'vendorCode'];
    for (int i = 0; i < parametersName.length; i++) {
      var response = await http.get(
          url + '/offers?${parametersName[i]}=${term}&from=${value}&limit=1');
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        for (var item in json.decode(source)) {
          offers.add(Offer.fromJson(item));
        }
      } else {
        // throw Offer.fromJson(results);
      }
    }

    return offers;
  }

  static Future<List<Category>> getCategories() async {
    var response = await http.get(url + '/categories');
    String source = Utf8Decoder().convert(response.bodyBytes);
    List<Category> categories = [];
    for (var item in json.decode(source)) {
      categories.add(Category.fromJson(item));
    }
    return categories;
  }
}

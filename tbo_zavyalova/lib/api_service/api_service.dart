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

  static Future<List<Offer>> getOffersFromPage({
    int page,
  }) async {
    int value = page * 24;
    var response = await http.get(url + '/offers?from=${value}&limit=1');
    List<Offer> offers = [];
    String source = Utf8Decoder().convert(response.bodyBytes);
    for (var item in json.decode(source)) {
      offers.add(Offer.fromJson(item));
    }
    return offers;
    // try {
    //   return await http.get(
    //     'https://api.punkapi.com/v2/beers?page=$page&per_page=$_perPage',
    //   );
    // } catch (e) {
    //   return e.toString();
    // }
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

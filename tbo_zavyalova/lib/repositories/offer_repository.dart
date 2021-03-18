import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/api_service/api_service.dart';
import 'package:tbo_zavyalova/models/offer.dart';

class OfferRepository extends ChangeNotifier {
  List<Offer> _items = [];

  Future<List<Offer>> load() async {
    final offers = await ApiService.getOffers();
    addAll(offers);
    return _items;
  }

  Future<List<Offer>> loadByPage(int page, {int categoryId}) async {
    final offers =
        await ApiService.getOffersFromPage(page, categoryId: categoryId);
    return offers;
  }

  Future<List<Offer>> search(int page, {int categoryId, String term}) async {
    final result = await ApiService.findOffersByWord(page,
        term: term, categoryId: categoryId);
    return (result);
  }

  void add(Offer item) {
    _items.add(item);
  }

  void addAll(List<Offer> items, {bool clear = false}) {
    if (clear) {
      _items.clear();
    }
    _items.addAll(items);
  }

  void removeAll() {
    _items.clear();
  }
}

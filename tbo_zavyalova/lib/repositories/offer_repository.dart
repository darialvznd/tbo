//TODO именование файла? (множественное или единственное)
import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/api_service/api_service.dart';
import 'package:tbo_zavyalova/models/offer.dart';

class OfferRepository extends ChangeNotifier {
  List<Offer> _items = [];
  // List<Offer> _displayedItems = [];

  Future<List<Offer>> load() async {
    final offers = await ApiService.getOffers();
    addAll(offers);
    return _items;
  }

  Future<List<Offer>> loadByPage(int page) async {
    final offers = await ApiService.getOffersFromPage(page);
    addAll(offers);
    return _items;
  }

  Future<List<Offer>> search(String term, int page) async {
    final result = await ApiService.findOffersByWord(term, page);
    return result;
  }

  void add(Offer item) {
    _items.add(item);
//    updateDisplayedItems();
  }

  void addAll(List<Offer> items, {bool clear = false}) {
    if (clear) {
      _items.clear();
    }
    _items.addAll(items);
    //   updateDisplayedItems();
  }

  void removeAll() {
    _items.clear();
    // updateDisplayedItems();
  }
}

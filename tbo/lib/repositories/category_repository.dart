//TODO именование файла? (множественное или единственное)
import 'package:flutter/material.dart';
import 'package:tbo/api_service/api_service.dart';
import 'package:tbo/models/category.dart';

class CategoryRepository extends ChangeNotifier {
  List<Category> _items = [];
  // List<Category> _displayedItems = [];

  Future<List<Category>> load() async {
    final categories = await ApiService.getCategories();
    addAll(categories);
    return _items;
  }

  void add(Category item) {
    _items.add(item);
//    updateDisplayedItems();
  }

  void addAll(List<Category> items, {bool clear = false}) {
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

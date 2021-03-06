import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/api_service/api_service.dart';
import 'package:tbo_zavyalova/models/category.dart';

class CategoryRepository extends ChangeNotifier {
  List<Category> _items = [];

  Future<List<Category>> load() async {
    final categories = await ApiService.getCategories();
    addAll(categories);
    return _items;
  }

  void add(Category item) {
    _items.add(item);
  }

  void addAll(List<Category> items, {bool clear = false}) {
    if (clear) {
      _items.clear();
    }
    _items.addAll(items);
  }

  String findWhere(int id) {
    for (var item in _items) {
      if (item.id == id) {
        return item.name;
      }
    }
    return "";
  }

  void removeAll() {
    _items.clear();
  }
}

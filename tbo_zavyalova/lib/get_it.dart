import 'package:get_it/get_it.dart';
import 'package:tbo_zavyalova/repositories/category_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(CategoryRepository());
}

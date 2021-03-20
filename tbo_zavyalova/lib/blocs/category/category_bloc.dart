import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/models/category.dart';
import 'package:tbo_zavyalova/repositories/category_repository.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryBloc({this.repository})
      : assert(repository != null),
        super(CategoryEmptyState());

  @override
  Stream<CategoryState> mapEventToState(event) async* {
    if (event is CategoryLoadEvent) {
      yield CategoryLoadingState();
      try {
        //  int id = event.idCategoryType;
        final List<Category> categoryList = await repository.load();
        if (categoryList != null && categoryList.isNotEmpty) {
          yield CategoryLoadedState(categoryList);
        } else {
          yield CategoryEmptyState();
        }
      } catch (e) {
        yield CategoryErrorState();
      }
    }
  }
}

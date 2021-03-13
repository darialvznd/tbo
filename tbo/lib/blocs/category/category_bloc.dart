import 'package:tbo/blocs/category/category_event.dart';
import 'package:tbo/blocs/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo/models/category.dart';
import 'package:tbo/repositories/category_repository.dart';

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
        final List<Category> taskList = await repository.load();
        if (taskList != null && taskList.isNotEmpty) {
          yield CategoryLoadedState(taskList);
        } else {
          yield CategoryEmptyState();
        }
      } catch (e) {
        yield CategoryErrorState();
      }
    }
  }
}

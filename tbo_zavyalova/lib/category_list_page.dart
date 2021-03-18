import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/blocs/category/category_bloc.dart';
import 'package:tbo_zavyalova/blocs/category/category_event.dart';
import 'package:tbo_zavyalova/blocs/category/category_state.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_event.dart';
import 'package:tbo_zavyalova/models/category.dart';
import 'package:tbo_zavyalova/serach/search_form.dart';
import 'package:tbo_zavyalova/styles/style.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final List<Category> _categories = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Категории")),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoadedState) {
            _categories.addAll(state.categories);
            Scaffold.of(context).hideCurrentSnackBar();
          }
        },
        builder: (context, state) {
          if (state is CategoryEmptyState) {
            return Text('Не удалось загрузить категории');
          } else if (state is CategoryLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryErrorState && _categories.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: () {
                    context.read<CategoryBloc>().add(CategoryLoadEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text('Ошибка, попробуйте снова', textAlign: TextAlign.center),
              ],
            );
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: ListView.builder(
                // padding: ,
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    //height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            _categories[index].name,
                            style: AppTextStyle.category,
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchForm(
                                categoryId: _categories[index].id,
                              )),
                    );
                  },
                ),
                // separatorBuilder: (context, index) =>
                //     const SizedBox(height: 20),
                itemCount: _categories.length,
              ),
            ),
          );
        },
      ),
    );
  }
}

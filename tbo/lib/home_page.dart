import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo/blocs/category/category_event.dart';

import 'blocs/category/category_bloc.dart';
import 'blocs/category/category_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CategoryBloc taskListBloc;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskListBloc = BlocProvider.of<CategoryBloc>(context);
      taskListBloc.add(CategoryLoadEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryEmptyState) {
        return Text('В данном разделе задачи отсутствуют');
      } else if (state is CategoryLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CategoryLoadedState) {
        return SingleChildScrollView(
            child: Text(state.categories.length.toString()));
      } else {
        return Center(child: Text('Возникла ошибка'));
      }
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/blocs/category/category_bloc.dart';
import 'package:tbo_zavyalova/blocs/category/category_event.dart';

import 'package:tbo_zavyalova/blocs/offer_search/offer_search_bloc.dart';

import 'package:tbo_zavyalova/screens/category_list_page.dart';

import 'package:tbo_zavyalova/repositories/offer_repository.dart';
import 'package:tbo_zavyalova/screens/offer_list_page.dart';

import 'package:tbo_zavyalova/styles/style.dart';
import 'package:tbo_zavyalova/get_it.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) =>
              CategoryBloc(repository: getIt())..add(CategoryLoadEvent()),
        ),
        BlocProvider<OfferSearchBloc>(
            create: (BuildContext context) =>
                OfferSearchBloc(offerRepository: OfferRepository())),
      ],
      child: MaterialApp(
          theme: AppTheme.theme,
          title: 'TBO',
          initialRoute: '/',
          routes: {
            '/': (context) => CategoryListPage(),
            'searchForm': (context) => SearchForm(),
          }),
    );
  }
}

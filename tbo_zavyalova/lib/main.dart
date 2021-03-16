import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/blocs/category/category_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer/offer_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer/offer_event.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_event.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_state.dart';
import 'package:tbo_zavyalova/element_page.dart';
import 'package:tbo_zavyalova/offer_card.dart';
import 'package:tbo_zavyalova/repositories/category_repository.dart';
import 'package:tbo_zavyalova/repositories/offer_repository.dart';
import 'package:tbo_zavyalova/screens/offers_list_page.dart';
import 'package:tbo_zavyalova/serach/search_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OfferBloc>(
          create: (BuildContext context) =>
              OfferBloc(repository: OfferRepository())..add(OfferFetchEvent()),
        ),
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) =>
              CategoryBloc(repository: CategoryRepository()),
        ),
        BlocProvider<OfferSearchBloc>(
            create: (BuildContext context) =>
                OfferSearchBloc(offerRepository: OfferRepository())),
      ],
      child: MaterialApp(
          title: 'TBO',
          //   theme: AppColor.getThemeData(),
          initialRoute: '/',
          routes: {
            '/': (context) => OfferListPage(),
          }
          //   onGenerateRoute: AppRouter.generateRoute,
          // initialRoute: '/TaskInfoPage',
          ),
    );
  }
}

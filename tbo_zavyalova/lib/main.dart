import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/blocs/category/category_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer/offer_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer/offer_event.dart';
import 'package:tbo_zavyalova/repositories/category_repository.dart';
import 'package:tbo_zavyalova/repositories/offer_repository.dart';
import 'package:tbo_zavyalova/screens/offers_list_page.dart';

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
      ],
      child: MaterialApp(
          title: 'TBO',
          //   theme: AppColor.getThemeData(),
          initialRoute: '/',
          routes: {
            '/': (context) => OfferBody(),
          }
          //   onGenerateRoute: AppRouter.generateRoute,
          // initialRoute: '/TaskInfoPage',
          ),
    );
  }
}

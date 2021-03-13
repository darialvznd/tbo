import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo/blocs/category/category_bloc.dart';
import 'package:tbo/home_page.dart';
import 'package:tbo/repositories/category_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
            '/': (context) => HomePage(),
          }
          //   onGenerateRoute: AppRouter.generateRoute,
          // initialRoute: '/TaskInfoPage',
          ),
    );
  }
}

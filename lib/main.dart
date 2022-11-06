import 'package:flutter/material.dart' hide Router;
import 'package:product_tracker_app/application/routing/router.dart';
import 'package:product_tracker_app/presentation/pages/initial/home_preparer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juli\'s Product Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color.fromARGB(255, 37, 117, 100),
        secondary: Color.fromRGBO(254, 178, 58, 1),
      )),
      home: HomePreparer(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

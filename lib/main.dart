import 'package:flutter/material.dart';

import 'formsAndValidation/forms_and_validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) {
          return FormsAndValidation();
        },
        // 'second': (ctx) {
        //   return SecondScreeen(dataFromFirst: 'Test Data');
        // },
        // 'Third': (ctx) {
        //   return ThirdScreen();
        // },
      },
      initialRoute: '/',
    );
  }
}

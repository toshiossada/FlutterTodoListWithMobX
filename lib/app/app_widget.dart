import 'package:flutter/material.dart';
import 'package:mobx_example/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeModule(),
    );
  }
}

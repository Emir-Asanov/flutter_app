import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/notebook.dart';
void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.green,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/Note': (context) => Note(),
},
));


import 'package:animate_do_examples/src/pages/example_page_1.dart';
import 'package:flutter/material.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate Do',
      home: ExamplePage1(),
      // home: TwitterPage(),
      // home: NavigationPage(),
    );
  }
}
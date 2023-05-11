import 'package:api/comment.dart';
import 'package:api/example_four.dart';
import 'package:api/five.dart';
import 'package:api/getuser.dart';
import 'package:api/home.dart';
import 'package:api/hometwo.dart';
import 'package:api/page_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Five(),
    );
  }
}
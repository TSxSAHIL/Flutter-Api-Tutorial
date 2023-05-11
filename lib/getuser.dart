import 'dart:convert';

import 'package:api/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExThree extends StatefulWidget {
  const ExThree({super.key});

  @override
  State<ExThree> createState() => _ExThreeState();
}

class _ExThreeState extends State<ExThree> {
  List<UserModel> userlist = [];
  Future<List<UserModel>> getuserapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      data.forEach((i) {
        Map<String, dynamic> mapWithStringKeys = i.cast<String, dynamic>();
        userlist.add(UserModel.fromJson(mapWithStringKeys));
      });
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three Complex Json'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getuserapi(),
                  builder: ((context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: userlist.length,
                          itemBuilder: ((context, index) {
                            return Card(
                              child: Column(),
                            );
                          }));
                    }
                  })))
        ],
      ),
    );
  }
}

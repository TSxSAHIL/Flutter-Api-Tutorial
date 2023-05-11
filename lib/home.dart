import 'dart:convert';

import 'package:api/Models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> modellist = [];
  Future<List<Model>> getpostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      data.forEach((i) {
        Map<String, dynamic> mapWithStringKeys = i.cast<String, dynamic>();
        modellist.add(Model.fromJson(mapWithStringKeys));
      });
      return modellist;
    } else {
      return modellist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API's"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getpostApi(),
              builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Text("Loading");
              }else{
                return ListView.builder(
                  itemCount: modellist.length,
                  itemBuilder: ((context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(modellist[index].title.toString()),
                          Text(modellist[index].body.toString()),
                        ],
                      ),
                    ),
                  );
                }));
              }
            },),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:html';

import 'package:api/Models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<AlbumModel> albumlist = [];
  Future<List<AlbumModel>> getalbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode == 200){
      for(Map i in data){
        AlbumModel album = AlbumModel(title: i['title'] , completed: i['completed']);
        albumlist.add(album);

      }
      return albumlist;
    }else{
      return albumlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getalbum(),
              builder: ((context, snapshot) {
              return ListView.builder(
                itemCount: albumlist.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title'+albumlist[index].title.toString()),
                        Text('Task Completion'+albumlist[index].completed.toString()),
                      ],
                    ),
                  );
              }));
            })) 
            )
        ],
      ),
    );
  }
}
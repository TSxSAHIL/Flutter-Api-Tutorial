// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {

  Future<void> getUserApis () async{
    var data;
    final respone = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(respone.statusCode == 200){
      data = jsonDecode(respone.body.toString());
    }
    else{
       
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApis(),
              builder: (context , snapshot){

                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text('Loading');
                }else {
                  var data;
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        children: [
                          ReusbaleRow(title: 'name', value: data[index]['name'].toString(),),
                          ReusbaleRow(title: 'Username', value: data[index]['username'].toString(),),
                          ReusbaleRow(title: 'address', value: data[index]['address']['street'].toString(),),
                          ReusbaleRow(title: 'Lat', value: data[index]['address']['geo']['lat'].toString(),),
                          ReusbaleRow(title: 'Lat', value: data[index]['address']['geo']['lng'].toString(),),

                        ],
                      ),
                    );
                  });
                }

              },
            ),
          )
        ],
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),

        ],
      ),
    );
  }
}
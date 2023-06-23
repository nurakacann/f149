import 'package:flutter/material.dart';
import 'package:patico/pages/Posts.dart';
import 'package:flutter/cupertino.dart';

class homepage extends StatelessWidget {
  final List people = [
    "Bilal",
    "Nura",
    "Nazife",
    "Burak",
    "İlkem",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const
        Text('PatiCo'),

      ),
      body: Column(
        children: [
          //Posts
          Expanded(
            child: ListView.builder(itemCount: people.length,
                itemBuilder: (context,index) {
                  return Post(
                    name: people[index],
                  );
                }),
          ),
        ],
      ),
    );

  }

  Widget buildInfoRow(String label, TextStyle textStyle) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 8),
      child: Text(
        "$label: ",
        style: textStyle,
      ),
    );
  }
}
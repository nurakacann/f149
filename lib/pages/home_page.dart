import 'package:flutter/material.dart';
import 'package:patico/pages/Posts.dart';

class HomePage extends StatelessWidget {
  final List people = [
    "Bilal",
    "Nura",
    "Nazife",
    "Burak",
    "İlkem",
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        title: const Text('PatiCo'),
      ),
      body: Column(
        children: [
          //Posts
          Expanded(
            child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
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

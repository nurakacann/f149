import 'package:flutter/material.dart';
import 'package:patico/utils/colors.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white, size: 35),
            labelStyle: TextStyle(color: Colors.white, fontSize: 20),

            labelText:'Search',
          ),
          onFieldSubmitted: (String_){
            print(searchController.text);
          },
        ),
      ),
      //body: FutureBuilder(
        //future: FirebaseFirestore.instance.collection('user').get(),
      //),
    );
  }
}

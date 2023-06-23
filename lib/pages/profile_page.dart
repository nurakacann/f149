import 'package:flutter/material.dart';

class profilepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: Text('Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(9.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                  //backgroundImage: NetworkImage(profilePhotoUrl),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Name Surname',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'email',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  File? _imageFile;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genusController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _vaccinsController = TextEditingController();

  Future<void> _showImageSourceDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Pick Image from Gallery'),
                  onTap: () {
                    _getImageFromGallery();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: const Text('Take Image from Camera'),
                  onTap: () {
                    _getImageFromCamera();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  Future<void> _getImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genusController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    _cityController.dispose();
    _vaccinsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        title: const Text('Create a post'),
        actions: [
          IconButton(
            onPressed: _showImageSourceDialog,
            icon: const Icon(Icons.add_a_photo),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_imageFile != null)
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(_imageFile!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name:',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
            ),

          ),
          const SizedBox(height: 8),
          TextField(
            controller: _genusController,
            decoration: const InputDecoration(
              labelText: 'Genus:',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _genderController,
            decoration: const InputDecoration(
              labelText: 'Gender:',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ageController,
            decoration: const InputDecoration(
              labelText: 'Age:',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(
              labelText: 'City:',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _vaccinsController,
            decoration: const InputDecoration(
              labelText: 'Vaccins:',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              // Perform the desired functionality, e.g., submit the data
              String name = _nameController.text;
              String genus = _genusController.text;
              String gender = _genderController.text;
              String age = _ageController.text;
              String city = _cityController.text;
              String vaccins = _vaccinsController.text;

              // Use the values as needed
              print('Name: $name');
              print('Genus: $genus');
              print('Gender: $gender');
              print('Age: $age');
              print('City: $city');
              print('Vaccins: $vaccins');
            },
            child: const Text('Submit'),
          ),

        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddPage(),
  ));
}


import 'package:flutter/material.dart';
import 'package:patico/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  _selectImage(BuildContext context) async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Image',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 25,
            ),
          ),

          children: [
            SimpleDialogOption(
              child: const Text('Take a photo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),

              ),
              onPressed: () {
                Navigator.pop(context, ImageSource.camera);
              },
            ),
            SimpleDialogOption(
              child: const Text('Choose from gallery',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );

    if (source != null) {
      final XFile? selectedImage = await _imagePicker.pickImage(source: source);
      if (selectedImage != null) {
        setState(() {
          _selectedImage = selectedImage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Implement the desired functionality
          },
        ),
        title: Text('Post to'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              // Implement the desired functionality
            },
            child: const Text(
              'Post',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGV0JTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60'
                  ),
                  radius: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () => _selectImage(context),
                  child: Text('Select Image'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

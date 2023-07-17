import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Uint8List? _imageBytes;
  String? _imageURL;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _pickImage() async {
    final input = FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((event) {
        setState(() {
          _imageBytes = reader.result as Uint8List?;
        });
      });
    });
  }

  Future<String?> _uploadImage(Uint8List imageBytes) async {
    final storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    final uploadTask = storageRef.putData(imageBytes);
    final snapshot = await uploadTask;

    return await snapshot.ref.getDownloadURL();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String? imageUrl;

      if (_imageBytes != null) {
        imageUrl = await _uploadImage(_imageBytes!);
      }

      final user = {
        'name': _nameController.text,
        'email': _emailController.text,
        'image': imageUrl,
      };

      await FirebaseFirestore.instance.collection('users').add(user);

      _nameController.clear();
      _emailController.clear();
      setState(() {
        _imageBytes = null;
        _imageURL = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Choose Image'),
              ),
              const SizedBox(height: 16.0),
              if (_imageBytes != null)
                Image.memory(
                  _imageBytes!,
                  width: 200,
                  height: 200,
                ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uploaded Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active ||
              !snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return ListTile(
                leading: item['image'] != null
                    ? Image.network(
                        item['image'] as String,
                        width: 40,
                        height: 40,
                      )
                    : const SizedBox.shrink(),
                title: Text(item['name'] as String),
                subtitle: Text(item['email'] as String),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FaultReportingScreen extends StatefulWidget {
  const FaultReportingScreen({super.key});

  @override
  _FaultReportingScreenState createState() => _FaultReportingScreenState();
}

class _FaultReportingScreenState extends State<FaultReportingScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  String? _description;
  File? _image;

  // Function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Fault'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Fault Category Dropdown
              const Text(
                'Select Fault Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Leakage', child: Text('Water Leakage')),
                  DropdownMenuItem(value: 'Interruption', child: Text('Supply Interruption')),
                  DropdownMenuItem(value: 'Quality', child: Text('Water Quality Issue')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a category' : null,
                hint: const Text('Select a category'),
              ),
              const SizedBox(height: 20),

              // Description Field
              const Text(
                'Describe the Issue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Provide details of the issue you are facing...',
                ),
                onChanged: (value) {
                  _description = value;
                },
                validator: (value) => value == null || value.isEmpty ? 'Please enter a description' : null,
              ),
              const SizedBox(height: 20),

              // Image Upload Section
              const Text(
                'Upload a Photo (optional)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera),
                    label: const Text('Camera'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Gallery'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _image != null
                  ? Image.file(
                      _image!,
                      height: 200,
                    )
                  : const Text('No image selected'),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission logic here
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fault report submitted successfully')));
                    // Optionally, you can navigate to another page or clear the form after submission
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

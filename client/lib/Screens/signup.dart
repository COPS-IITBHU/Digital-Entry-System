import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For working with image files

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
  //TODO: Resolve this while setting up API
}

class _SignUpPageState extends State<SignUpPage> {
  File? _selectedImage; // For storing the selected image

  // Function to pick an image using ImagePicker
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // final TextEditingController _emailController = TextEditingController();
  // String? _validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   } else if (!value.endsWith('@itbhu.ac.in')||!value.endsWith('@iitbhu.ac.in')) {
  //     return 'Email must end with "@itbhu.ac.in" or "@iitbhu.ac.in"';
  //   }
  //   return null;
  // }
  // thought ki ise use me leke I could make sure that the email is valid
  //TODO: Implement the email validation
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign-Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8A2BE2), // Purple background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const CustomTextField(label: 'Name'),
                        const SizedBox(height: 10),
                        const CustomTextField(label: 'Roll Number'),
                        const SizedBox(height: 10),
                        const CustomTextField(label: 'Year'),
                        const SizedBox(height: 10),
                        const CustomTextField(label: 'DOB'),
                        const SizedBox(height: 10),
                        const CustomTextField(label: 'Hostel'),
                        const SizedBox(height: 10),
                        const CustomTextField(label: 'Institute Email'),
                        const SizedBox(height: 10),

                        // Image upload section
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.purple.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: _selectedImage != null
                                ? Image.network(
                                    _selectedImage!.path,
                                    fit: BoxFit.cover,
                                  )
                                : const Center(
                                    child: Text(
                                      'Tap to upload ID image',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          //TODO: Implement the add vehicle functionality
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 46, 216, 250), // Yellow button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Add Vehicle',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      //TODO: Implement the sign-up functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Sign-Up',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.purple.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

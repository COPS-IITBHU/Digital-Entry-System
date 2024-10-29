import 'package:client/Models/student.dart';
import 'package:client/Screens/login.dart';
import 'package:client/Screens/student_profile.dart';
import 'package:flutter/material.dart';

class ManualInput extends StatefulWidget {
  const ManualInput({super.key});

  @override
  State<ManualInput> createState() => _ManualInputState();
}

class _ManualInputState extends State<ManualInput> {
  bool studentEntered = false;
  late Student student;
  @override
  Widget build(BuildContext context) {
    if (studentEntered) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const CustomTextField(label: 'Roll Number'),
              const SizedBox(height: 16),
              const CustomTextField(label: 'Name'),
              const SizedBox(height: 16),
              const CustomTextField(label: 'Issue'),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //TODO: Fetch the student and initialize the student.
                      studentEntered = true;
                    });
                  },
                  child: const Text('Fetch The Student'))
            ],
          ),
        ),
      );
    } else {
      return StudentProfilePage(student: student);
    }
  }
}

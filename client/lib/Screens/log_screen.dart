import 'package:client/Models/logs.dart';
import 'package:client/Models/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => LogScreenState();
}

class LogScreenState extends State<LogScreen> {
  Student student = Student(
    id: 0,
    name: '',
    age: 0,
    department: '',
    course: '',
    year: 0,
    logs: [],
    vehicles: [],
    imageUrl: "",
  );
  //Placeholder student
  //TODO: Change to actual student
  Future<List<Log>> studentLogs() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/students/1/logs'),
      //TODO: Change to dynamic URI specific to student or to a general case for proctor side.
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      student = Student.fromJson(data);
      return student.logs;
    } else {
      throw Exception('Failed to load logs');
    }
  }
 //TODO: Implement the proper getter for the student logs
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: studentLogs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  }
                  return const Placeholder();
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:client/Models/student.dart';
import 'package:client/Screens/student_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final Student dummyUser = Student(
  id: 1,
  name: "John Doe",
  email: 'johndoe@example.com',
  dob: DateTime(1900),
  //TODO: Overflow  error handle not handled for long names, is it required?
  department: "Student Department",
  course: "computer science Engineering",
  year: 2,
  logs: [],
  vehicles: ['Bicycle', 'Scooter'],
  imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSixEKfEcJhD3fau0Pr-zDTEXgn9r9V3pqa4g&s", // random image picked for now...
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StudentHomeScreen(),
    );
  }
}

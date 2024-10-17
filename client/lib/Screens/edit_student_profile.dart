import 'package:client/Models/student.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final Student student;

  EditProfilePage({required this.student});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  List<String> _vehicles = [];

  @override
  void initState() {
    super.initState();
    _vehicles = List<String>.from(widget.student.vehicles);
  }

  void _addVehicle() {
    setState(() {
      _vehicles.add('');
    });
  }

  void _removeVehicle(int index) {
    setState(() {
      _vehicles.removeAt(index);
    });
  }

  void _saveProfile() {
    setState(() {
      // Remove empty or whitespace-only strings from _vehicles
      _vehicles.removeWhere((vehicle) => vehicle.trim().isEmpty);
      widget.student.vehicles = _vehicles;
    });
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => StudentProfilePage(
    //         student: widget.student), // pass the student data
    //   ),
    // );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveProfile, // Save changes and navigate back
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vehicles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _vehicles.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: _vehicles[index],
                        onChanged: (value) {
                          setState(() {
                            _vehicles[index] = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Vehicle ${index + 1}',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => _removeVehicle(index),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addVehicle,
              child: Text('Add Vehicle'),
            ),
          ],
        ),
      ),
    );
  }
}

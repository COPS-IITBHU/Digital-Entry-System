import 'package:client/Models/student.dart';
import 'package:client/Screens/edit_student_profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentProfilePage extends StatefulWidget {
  final Student student;
  const StudentProfilePage({super.key, required this.student});
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  // Dummy student for testing purposes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Name
            Center(
              child: Column(
                children: [
                  Image.network(
                    widget.student.imageUrl,
                    fit: BoxFit
                        .cover, // This will make the image cover the entire container
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Center(
                          child: Icon(Icons.error)); // Handle error case
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.student.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Student Details
            _buildInfoRow('Date Of Birth',
                DateFormat('dd-MM-yyyy').format(widget.student.dob)),
            _buildInfoRow('Department', widget.student.department.toString()),
            _buildInfoRow('Course', widget.student.course.toString()),
            _buildInfoRow('Year', 'Year ${widget.student.year.toString()}'),
            // _buildInfoRow('Vehicles', widget.student.vehicles.join(', ')),
            _buildVehiclesList()
          ],
        ),
      ),
    );
  }

  // Reusable widget for displaying key-value info
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  // Reusable widget for displaying vehicles list
  Widget _buildVehiclesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Vehicles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            student: widget.student,
                          )),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // Padding around the ListView
          height: MediaQuery.of(context).size.height *
              0.3, // Set height to consume space
          child: widget.student.vehicles.isEmpty
              ? Center(
                  child: Text('No vehicles added',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                )
              : ListView.builder(
                  itemCount: widget.student.vehicles.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0), // Space around the tile
                      padding: const EdgeInsets.all(16.0), // Space inside the tile
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // Shadow color
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 5, // Blur radius of the shadow
                            offset: const Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Text(
                        widget.student.vehicles[index],
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:client/Models/student.dart';
import 'package:client/main.dart';

class ProctorLocationInput extends StatefulWidget {
  const ProctorLocationInput({super.key});

  @override
  State<ProctorLocationInput> createState() => _ProctorLocationInputState();
}

class _ProctorLocationInputState extends State<ProctorLocationInput> {
  Student student = dummyUser; // TODO: Change to the actual student

  final List<String> _rajputanaEntries = [];
  final Map<int, List<String>> _locationDetails = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < dummyUser.vehicles.length; i++) {
      _rajputanaEntries.add(" Rajputana Barricades - ${dummyUser.vehicles[i]}");
    }

    _locationDetails.addAll({
      1: [
        'SAC - Gym',
        'SAC - TT Room',
        'SAC - Badminton Court',
        'SAC - Squash Court',
        'SAC - Chess',
        'SAC - Meditation',
        'SAC - Boxing',
        'SAC - Wrestling'
      ],
      2: ['Library - Books', 'Library - Reading Room'],
      3: _rajputanaEntries,
      4: ['Girls Hostel - Block A'],
    });
  }

  int? _selectedMainLocation;
  List<String> _rooms = [];
  String? _selectedRoom;

  @override
  Widget build(BuildContext context) {
    var selectedRoom = _selectedRoom;

    return Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              const Text(
                'Enter the Location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
      
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:   DropdownMenu<int>(
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: 'SAC'),
                    DropdownMenuEntry(value: 2, label: 'Library'),
                    DropdownMenuEntry(
                        value: 3, label: 'Rajputana Barricades'),
                    DropdownMenuEntry(value: 4, label: 'Girls Hostel'),
                  ],
                  onSelected: (value) => setState(() {
                    _selectedMainLocation = value;
                    _rooms = _locationDetails[value!] ?? [];
                    _selectedRoom = null;
                  }),
                  initialSelection: _selectedMainLocation,
                  label: const Text('Select Main Location'),
                ),
              ),
              const SizedBox(height: 20),
      
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Expanded(
                  child: DropdownMenu<String>(
                    dropdownMenuEntries: _rooms.map((room) {
                      return DropdownMenuEntry<String>(
                        value: room,
                        label: room,
                      );
                    }).toList(),
                    onSelected: (value) => setState(() {
                      _selectedRoom = value;
                    }),
                    initialSelection: selectedRoom,
                    label: const Text('Select Room'),
                  ),
                ),
              ),
      
              const SizedBox(height: 20),
      
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement log functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Log',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

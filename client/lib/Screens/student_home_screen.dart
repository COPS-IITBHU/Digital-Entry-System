import 'package:client/Models/logs.dart';
import 'package:client/Screens/student_profile.dart';
import 'package:client/Widgets/qr_generation.dart';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => StudentHomeScreenState();
}

class StudentHomeScreenState extends State<StudentHomeScreen> {
  List<Log> logs = [];
  Future<List<Log>> studentLogs() async {
    // TODO: Implement the logic to fetch logs of the specific student logged in right now.
    return logs;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> sortedLogs = logs
        .map((log) => {
              'date': log.date,
              'time': log.time,
              'location': log.location,
              'id': log.id,
            })
        .toList();
    sortedLogs.sort((a, b) {
      DateTime? dateA = parseDateTime(a['date'] as String, a['time'] as String);
      DateTime? dateB =
          parseDateTime(b['date']! as String, b['time']! as String);
      return dateB!.compareTo(dateA!);
    });
    // date and time ke hisIab se sort kar raha hai

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Digital-Entry'),
          backgroundColor: Colors.purple,
          leading: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentProfilePage(
                      student:
                          dummyUser), // Replace with your ProfileScreen widget
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              color: const Color.fromARGB(255, 0, 0, 0),
              onPressed: () {
                // Implement logout logic here
                // For example, clear user session and navigate to login screen
              },
            ),
          ],
        ),
        body: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 195, 176, 176),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Generate',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Press Generate to generate the QR',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QrGeneration(),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      child: const Text('Generate',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              // Central image section
              Expanded(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.67,
                  child: Expanded(child: Image.network(dummyUser.imageUrl)),
                ),
              ),
              //TODO: Replace dummy student with real.
              const SizedBox(height: 20),
              // Student logs section
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Your logs →',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: sortedLogs.length,
                  itemBuilder: (context, index) {
                    var log = sortedLogs[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${log['location']} ${log['id']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('${log['time']} ${log['date']}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime? parseDateTime(String date, String time) {
    try {
      DateFormat dateFormat = DateFormat('dd/MM/yy');
      DateTime parsedDate = dateFormat.parse(date);

      if (time.toLowerCase() != 'some time') {
        DateFormat timeFormat = DateFormat('HH:mm');
        DateTime parsedTime = timeFormat.parse(time);
        return DateTime(parsedDate.year, parsedDate.month, parsedDate.day,
            parsedTime.hour, parsedTime.minute);
      }

      return parsedDate;
    } catch (e) {
      return null;
    }
  }
}

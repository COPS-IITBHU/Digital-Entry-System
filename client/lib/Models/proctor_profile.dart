import 'package:client/Models/logs.dart';

class Proctor {
  final int id;
  final String name;
  final String department;
  final String email;
  final String phone;
  final List<String> locations;
  final List<Log> logs;

  Proctor({
    required this.id,
    required this.name,
    required this.department,
    required this.email,
    required this.phone,
    required this.locations,
    required this.logs,
  });

  factory Proctor.fromJson(Map<String, dynamic> json) {
    var logList = json['logs'] as List;
    List<Log> logs = logList.map((log) => Log.fromJson(log)).toList();

    return Proctor(
      id: json['id'],
      name: json['name'],
      department: json['department'],
      email: json['email'],
      phone: json['phone'],
      locations: List<String>.from(json['locations']),
      logs: logs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'department': department,
      'email': email,
      'phone': phone,
      'locations': locations,
      'logs': logs.map((log) => log.toJson()).toList(),
    };
  }
}

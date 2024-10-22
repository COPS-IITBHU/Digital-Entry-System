import "package:client/Models/logs.dart";
class Student {
 int id;
 String name;
 String email;
 DateTime dob;
 String department;
 String course;
 int year;
 List<Log> logs;
 List<String> vehicles;
 String imageUrl;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    required this.department,
    required this.course,
    required this.year,
    required this.logs,
    required this.vehicles,
    required this.imageUrl,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    var logList = json['logs'] as List;
    List<Log> logs = logList.map((log) => Log.fromJson(log)).toList();

    var vehicleList = List<String>.from(json['vehicles']);

    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      dob: json['dob'],
      department: json['Department'],
      course: json['Course'],
      year: json['Year'],
      logs: logs,
      vehicles: vehicleList,
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email':email,
      'dob': dob,
      'Department': department,
      'Course': course,
      'Year': year,
      'logs': logs.map((log) => log.toJson()).toList(),
      'vehicles': vehicles,
      'imageUrl': imageUrl,
    };
  }
}

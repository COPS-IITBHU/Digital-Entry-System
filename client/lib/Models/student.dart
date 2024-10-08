import "package:client/Models/logs.dart";
class Student {
  final int id;
  final String name;
  final int age;
  final String department;
  final String course;
  final int year;
  final List<Log> logs;
  final List<String> vehicles;
  final String imageUrl;

  Student({
    required this.id,
    required this.name,
    required this.age,
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
      age: json['age'],
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
      'age': age,
      'Department': department,
      'Course': course,
      'Year': year,
      'logs': logs.map((log) => log.toJson()).toList(),
      'vehicles': vehicles,
      'imageUrl': imageUrl,
    };
  }
}

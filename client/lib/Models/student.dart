import "package:client/Models/logs.dart";

class Student {
  int id;
  String name;
  String email;
  DateTime dob;
  int year;
  List<Log> logs;
  List<String> vehicles;
  String imageUrl;

  // Constructor without 'department'
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    required this.year,
    required this.logs,
    required this.vehicles,
    required this.imageUrl,
  });

  // Getter for department based on ID
  String get department {
    String code = id.toString().substring(2, 4);
    switch (code) {
      case '01':
        return 'Computer Science';
      case '02':
        return 'Electronics and Communication';
      case '03':
        return 'Electrical';
      case '04':
        return 'Mechanical';
      case '05':
        return 'Civil';
      case '06':
        return 'Chemical';
      case '07':
        return 'Biotechnology';
      case '11':
        return 'Metallurgy';
      case '12':
        return 'Mining';
      case '14':
        return 'Biochemical';
      case '17':
        return 'Industrial Production';
      case '18':
        return 'Architecture';
      case '16':
        return 'Pharmacy';
      default:
        return "Unknown";
    }
  }
  //TODO: Change the numbers to real values

  String get course {
    String code = id.toString().substring(4);
    switch (code) {
      case '5':
        return 'B.Tech';
      case '2':
        return 'M.Tech';
      case '3':
        return 'PhD';
      case '4':
        return 'IDD';
      case '6':
        return 'B.Arch';
      case '7':
        return 'B.Pharm';
      default:
        return "Unknown";
    }
  }
  //TODO: Change the numbers to real values

  factory Student.fromJson(Map<String, dynamic> json) {
    var logList = json['logs'] as List;
    List<Log> logs = logList.map((log) => Log.fromJson(log)).toList();

    var vehicleList = List<String>.from(json['vehicles']);

    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      dob: DateTime.parse(json['dob']), // Parse the DOB to DateTime
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
      'email': email,
      'dob': dob.toIso8601String(), // Convert DOB to a string
      'Department': department,
      'Course': course,
      'Year': year,
      'logs': logs.map((log) => log.toJson()).toList(),
      'vehicles': vehicles,
      'imageUrl': imageUrl,
    };
  }
}

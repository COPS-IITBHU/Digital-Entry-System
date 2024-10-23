import 'package:client/Models/logs.dart';

class Proctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final List<Log> logs;
  final String imgURL;

  Proctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.logs,
    required this.imgURL,
  });

  factory Proctor.fromJson(Map<String, dynamic> json) {
    var logList = json['logs'] as List;
    List<Log> logs = logList.map((log) => Log.fromJson(log)).toList();

    return Proctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      logs: logs,
      imgURL:  json['imgURL']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'logs': logs.map((log) => log.toJson()).toList(),
      'imgURL': imgURL,
    };
  }
}

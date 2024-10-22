class Log {
  final int id;
  final String date;
  final String time;
  final String location;
  final int studentId;
  Log({
    required this.id,
    required this.date,
    required this.time,
    required this.location,
    required this.studentId,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      id: json['id'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      studentId: json['studentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'location': location,
      'studentId': studentId,
    };
  }
}

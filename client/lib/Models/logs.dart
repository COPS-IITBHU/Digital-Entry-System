class Log {
  final int id;
  final String date;
  final String time;
  final String location;

  Log({
    required this.id,
    required this.date,
    required this.time,
    required this.location,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      id: json['id'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'location': location,
    };
  }
}

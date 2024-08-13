import 'course.dart';

class Student {
  // Variable
  static int idCount = 1;
  final int id;
  final int nationalId;
  final String name;
  final Map<Course, int> scores = {};

  // Constractor
  Student({
    required this.nationalId,
    required this.name,
  }) : id = idCount++;

  // Methods
  @override
  String toString() =>
      "id: $id, name: $name, nationalId: $nationalId , scores: $scores";

  // calculate average of student
  double average() {
    double avg = 0;
    int count = 0;
    for (var score in this.scores.values) {
      avg += score;
      count++;
    }
    return avg / count;
  }
}

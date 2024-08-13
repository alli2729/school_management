import 'course.dart';

class Teacher {
  // Variable
  static int idCount = 1;
  final int id;
  final int personalId;
  final String name;
  final List<Course> _limitedCourses = [];

  // Constractor
  Teacher({
    required this.personalId,
    required this.name,
  }) : id = idCount++;

  // Methods

  @override
  String toString() =>
      "id: $id, name: $name, personalId: $personalId, courses: $limitedCourses";

  // Getter
  List<Course> get limitedCourses => _limitedCourses;
}

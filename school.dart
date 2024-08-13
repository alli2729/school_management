import 'course.dart';
import 'student.dart';
import 'teacher.dart';

class School {
  // Variable
  final List<Teacher> _teachers = [];
  final List<Student> _students = [];
  final List<Course> _courses = [];

  // Constractor

  //* Methods
  //! Teacher
  // checking if teacher exist
  bool isTeacherExist({required int teacherId}) =>
      (teachers.any((teacher) => teacher.personalId == teacherId))
          ? true
          : false;

  // add teacher to list
  void addTeacher({required Teacher teacher}) =>
      (!isTeacherExist(teacherId: teacher.personalId))
          ? teachers.add(teacher)
          : print('${teacher.name} is already exist');

  // add course to teacher
  void addCourseToTeacher({required int courseId, required int teacherId}) {
    final Teacher t = getTeacher(teacherId: teacherId);
    t.limitedCourses.add(getCourse(courseId: courseId));
  }

  // get teacher from list
  Teacher getTeacher({required int teacherId}) =>
      teachers.firstWhere((teacher) => teacher.personalId == teacherId);

  //! Student
  // checking if student exist
  bool isStudentExist({required int studentId}) =>
      (students.any((student) => student.nationalId == studentId))
          ? true
          : false;

  // add student to list
  void addStudent({required Student student}) =>
      (!isStudentExist(studentId: student.nationalId))
          ? students.add(student)
          : print('${student.name} is already exist');

  // get index of student in list
  int studentIndex({required int studentId}) =>
      students.indexWhere((student) => student.nationalId == studentId);

  // get teacher from list
  Student getStudent({required int studentId}) =>
      students.firstWhere((student) => student.nationalId == studentId);

  // calculate average of student
  double averageOfStudent({required int studentId}) {
    final Student s = getStudent(studentId: studentId);
    return s.average();
  }

  // prints average of all students
  void averageOfAllStudents() {
    for (var student in students) {
      print(student.name);
      print(student.average());
    }
  }

  //! Course
  // checking if course exist
  bool isCourseExist({required String courseTitle}) =>
      (courses.any((course) => course.title == courseTitle)) ? true : false;

  // add course to list
  void addCourse({required Course course}) =>
      (!isCourseExist(courseTitle: course.title))
          ? courses.add(course)
          : print('${course.title} is already exist');

  // add score to course of student
  void addScore(
      {required int studentId,
      required int courseId,
      required int score,
      required int teacherId}) {
    // check if score is valid
    if (score >= 0 && score <= 20) {
      final Teacher t = getTeacher(teacherId: teacherId);
      // check if teacher has course
      if (t.limitedCourses.any((course) => course.id == courseId)) {
        final Student s = students[studentIndex(studentId: studentId)];
        s.scores[getCourse(courseId: courseId)] = score;
      } else {
        print('${t.name} is not valid teacher');
      }
    } else {
      print('Score must be between 0 and 20 !');
    }
  }

  // get course from list
  Course getCourse({required int courseId}) =>
      courses.firstWhere((course) => course.id == courseId);

  // Getters
  List<Teacher> get teachers => _teachers;
  List<Student> get students => _students;
  List<Course> get courses => _courses;
}

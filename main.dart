import 'dart:io';

import 'course.dart';
import 'school.dart';
import 'student.dart';
import 'teacher.dart';

void main(List<String> args) {
  School maaref4 = School();

  List<Student> students = [
    Student(nationalId: 1234, name: 'Ali Karimi'),
    Student(nationalId: 12345, name: 'Sina Rezaei'),
    Student(nationalId: 54832, name: 'Shayan Zare'),
  ];

  for (var student in students) {
    maaref4.addStudent(student: student);
  }

  List<Teacher> teachers = [
    Teacher(personalId: 1, name: 'Mohammad Karimi'),
    Teacher(personalId: 2, name: 'Paria Negahdari'),
  ];

  for (var teacher in teachers) {
    maaref4.addTeacher(teacher: teacher);
  }

  maaref4.addCourse(
    course: Course(title: 'Math'), // id = 1
  );
  maaref4.addCourse(
    course: Course(title: 'English'), // id = 2
  );

  maaref4.addCourseToTeacher(courseId: 1, teacherId: 1);
  maaref4.addCourseToTeacher(courseId: 2, teacherId: 2);

  maaref4.addScore(studentId: 1234, courseId: 1, score: 20, teacherId: 1);
  maaref4.addScore(studentId: 1234, courseId: 2, score: 10, teacherId: 2);
  maaref4.addScore(studentId: 12345, courseId: 1, score: 17, teacherId: 1);
  maaref4.addScore(studentId: 54832, courseId: 2, score: 13, teacherId: 2);

  stdout.write('Students : ');
  print(maaref4.students);

  stdout.write('Teachers : ');
  print(maaref4.teachers);

  stdout.write('Courses : ');
  print(maaref4.courses);

  maaref4.averageOfAllStudents();
}

class Course {
  // Variable
  static int idCount = 1;
  final int id;
  final String title;

  // Constractor
  Course({
    required this.title,
  }) : id = idCount++;

  // Methods
  @override
  String toString() => '($id. $title)';
}

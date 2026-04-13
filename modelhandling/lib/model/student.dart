class Student {
  final String id;
  final String name;
  final String course;
  final double gpa;

  Student({
    required this.id,
    required this.name,
    required this.course,
    required this.gpa,
  });

  // Calculate average (in this context, GPA is already the average)
  double get average => gpa;

  // Determine status based on GPA (assuming 2.0 as passing threshold)
  String get status => average >= 2.0 ? 'Passed' : 'Failed';

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      course: map['course'] as String,
      gpa: (map['gpa'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'course': course,
      'gpa': gpa,
    };
  }
}


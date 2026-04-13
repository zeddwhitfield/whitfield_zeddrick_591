 import 'package:modelhandling/model/student.dart';

class StudentService{
  Future<List<Student>> fetchStudent() async {
    await Future.delayed(const Duration(seconds: 2));

    final rawData = [
      {'id': '2', 'name': 'Zeddrick Whitfield', 'age': 20, 'gpa': 1.5},
      {'id': '2', 'name': 'Lee Lee', 'age': 21, 'gpa': 1.6},
      {'id': '2', 'name': 'Dela Dela Cruz', 'age': 22, 'gpa': 1.7},
    ];
    
    return rawData.map((data) => Student.fromMap(data)).toList();
  }
 }

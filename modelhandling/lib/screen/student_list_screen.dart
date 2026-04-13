import 'package:flutter/material.dart';
import 'package:modelhandling/data/studentdata.dart';
import 'package:modelhandling/model/student.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final StudentService _studentService = StudentService();

  List<Student> students = [];   
  bool loading = false;
  String? errormessage;

  Future<void> loadStudent() async {
    try {
      final loadedStudent = await _studentService.fetchStudent();
      setState(() {
        students = loadedStudent;   
        loading = true;
      });
    } catch (e) {
      setState(() {
        errormessage = "Failed to load Student";
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

@override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: students.length,   
              itemBuilder: (context, index) {
                final student = students[index];   
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text('Age ${student.course} | GPA: ${student.gpa}'),
                );
              },
            ),
    );
  }
}

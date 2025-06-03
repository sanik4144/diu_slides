import 'package:flutter/material.dart';
import '../widgets/department_courses_content.dart';

class CoursesPage extends StatelessWidget {
  final String departmentName;

  const CoursesPage({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$departmentName Courses',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: DepartmentCoursesContent(departmentName: departmentName),
    );
  }
}

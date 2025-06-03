import 'package:flutter/material.dart';

class SlideDetailPage extends StatelessWidget {
  final String departmentName;
  final String courseName;

  const SlideDetailPage({
    super.key,
    required this.departmentName,
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$departmentName - $courseName',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Text(
          'Welcome to $departmentName - $courseName!',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

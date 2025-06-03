import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/course_lists.dart'; // Create this file next

class DepartmentCoursesContent extends StatelessWidget {
  final String departmentName;

  const DepartmentCoursesContent({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    final courseMap = departmentCourses[departmentName] ?? [];
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: courseMap.length,
      itemBuilder: (context, index) {
        final courseName = courseMap[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              courseName,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              final url = getPdfUrl(departmentName, courseName);
              _launchURL(url);
            },
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

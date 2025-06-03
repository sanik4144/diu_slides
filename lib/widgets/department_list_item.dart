import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/department_data.dart';
import '../screens/courses_page.dart';

class DepartmentListItem extends StatelessWidget {
  final String departmentName;

  const DepartmentListItem({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          departmentName,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Provider.of<DepartmentData>(context, listen: false)
              .setSelectedDepartment(departmentName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoursesPage(departmentName: departmentName),
            ),
          );
        },
      ),
    );
  }
}

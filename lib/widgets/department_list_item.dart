import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/department_data.dart';
import '../screens/courses_page.dart';

class DepartmentListItem extends StatelessWidget {
  final String departmentName;

  const DepartmentListItem({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
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
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(206, 123, 82, 195),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: const Icon(Icons.school, color: Colors.deepPurple),
            title: Text(
              departmentName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}

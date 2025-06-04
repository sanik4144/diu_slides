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
                color: const Color.fromARGB(160, 0, 131, 176), // cool teal shadow
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: const Icon(Icons.school, color: Color(0xFF0083B0)), // blue-teal
            title: Text(
              departmentName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0083B0), // blue-teal text
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF0083B0)),
          ),
        ),
      ),
    );
  }
}

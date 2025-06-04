import 'package:flutter/material.dart';
import '../widgets/department_list_item.dart';

class DepartmentPage extends StatelessWidget {
  final List<String> departments = const [
    'CSE',
    'EEE',
    'SWE',
    'NFE',
    'BBA',
    'LLB',
    'ENGLISH',
    'CIVIL',
    'PHARMACY',
    'REAL ESTATE',
    'JOURNALISM',
  ];

  

  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Department List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return DepartmentListItem(departmentName: departments[index]);
          },
        ),
      ),
    );
  }
}

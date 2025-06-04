import 'package:flutter/material.dart';
import '../widgets/department_list_item.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allDepartments = const [
    'CSE',
    'EEE',
    'SWE',
    'NFE',
    'BBA',
    'MCT',
    'ENGLISH',
    'CIVIL',
    'PHARMACY',
    'REAL ESTATE',
    'JOURNALISM',
    
  ];

  List<String> _filteredDepartments = [];

  @override
  void initState() {
    super.initState();
    _filteredDepartments = _allDepartments;
    _searchController.addListener(_filterDepartments);
  }

  void _filterDepartments() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredDepartments = _allDepartments
          .where((dept) => dept.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _searchController,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search for a department...',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: const Icon(
                  Icons.manage_search_rounded,
                  color: Colors.deepPurple,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),

            const SizedBox(height: 16),
            // 🧾 Department List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredDepartments.length,
                itemBuilder: (context, index) {
                  return DepartmentListItem(
                    departmentName: _filteredDepartments[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

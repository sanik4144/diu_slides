import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/department_list_item.dart';
import '../widgets/app_drawer.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _allDepartments = const [
    'CSE', 'EEE', 'SWE', 'NFE', 'BBA', 'MCT',
    'Textile Engineering', 'CIVIL Engineering',
    'PHARMACY', 'REAL ESTATE', 'JOURNALISM',
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
      backgroundColor: const Color.fromARGB(255, 150, 230, 240), // cool blue background
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Custom Cool AppBar
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              decoration: const BoxDecoration(
                color: Color(0xFF0083B0), // deep teal
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 🍔 Hamburger on the left
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),

                      // 🏷️ Title in center (expanded)
                      Expanded(
                        child: Center(
                          child: Text(
                            'Department List',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 🔍 Search Bar
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.black87),
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
                          color: Color(0xFF0083B0), // match new theme
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 📋 Scrollable List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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

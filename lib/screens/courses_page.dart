import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/course_lists.dart'; // contains departmentCourses & getPdfUrl

class CoursesPage extends StatefulWidget {
  final String departmentName;

  const CoursesPage({super.key, required this.departmentName});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController _searchController = TextEditingController();

  late List<String> _allCourses;
  List<String> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _allCourses = departmentCourses[widget.departmentName] ?? [];
    _filteredCourses = _allCourses;
    _searchController.addListener(_filterCourses);
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCourses = _allCourses
          .where((course) => course.toLowerCase().contains(query))
          .toList();
    });
  }

  Future<void> _openCoursePdf(String course) async {
    final url = getPdfUrl(widget.departmentName, course);
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch the course material')),
      );
    }
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
        title: Text(
          '${widget.departmentName} Courses',
          style: const TextStyle(color: Colors.white),
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
                hintText: 'Search for a course...',
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
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 📋 Course List
            Expanded(
              child: _filteredCourses.isEmpty
                  ? const Center(child: Text('No courses found'))
                  : ListView.builder(
                      itemCount: _filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = _filteredCourses[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              course,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            leading: const Icon(Icons.menu_book, color: Colors.deepPurple),
                            trailing: const Icon(Icons.open_in_new, size: 18),
                            onTap: () => _openCoursePdf(course),
                          ),
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

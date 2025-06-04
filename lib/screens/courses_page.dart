import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/course_lists.dart';
import '../widgets/app_drawer.dart';
import '../globals/favorites.dart';

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

  void _toggleFavorite(String course) {
    final item = {
      'department': widget.departmentName,
      'course': course,
    };

    setState(() {
      final exists = favoriteCourses.any((c) =>
          c['department'] == widget.departmentName && c['course'] == course);
      if (exists) {
        favoriteCourses.removeWhere((c) =>
            c['department'] == widget.departmentName &&
            c['course'] == course);
      } else {
        favoriteCourses.add(item);
      }
      saveFavorites();
    });
  }

  bool _isFavorite(String course) {
    return favoriteCourses.any((item) =>
        item['department'] == widget.departmentName &&
        item['course'] == course);
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
      backgroundColor: const Color.fromARGB(255, 150, 230, 240),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              decoration: const BoxDecoration(
                color: Color(0xFF0083B0),
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
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '${widget.departmentName} Courses',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      controller: _searchController,
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
                          color: Color(0xFF0083B0),
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
            Expanded(
              child: _filteredCourses.isEmpty
                  ? const Center(
                      child: Text(
                        'No courses found',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = _filteredCourses[index];
                        final isFavorite = _isFavorite(course);

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
                                color: Color(0xFF0083B0),
                              ),
                            ),
                            leading: const Icon(
                              Icons.menu_book,
                              color: Color(0xFF0083B0),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isFavorite ? Icons.star : Icons.star_border,
                                    color: Colors.amber,
                                  ),
                                  onPressed: () => _toggleFavorite(course),
                                ),
                                const Icon(Icons.open_in_new, size: 18),
                              ],
                            ),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';
import '../globals/favorites.dart';
import '../data/course_lists.dart';

class MySpacePage extends StatelessWidget {
  const MySpacePage({super.key});

  Future<void> _openPdf(String department, String course) async {
    final url = getPdfUrl(department, course);
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch PDF for: $course');
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteList = favoriteCourses.toList(); // ✅ Convert Set to List

    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 150, 230, 240),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              decoration: const BoxDecoration(
                color: Color(0xFF0083B0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
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
                        'My Space',
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
            ),
            const SizedBox(height: 10),

            // 📄 Saved List
            Expanded(
              child: favoriteList.isEmpty
                  ? const Center(
                      child: Text(
                        'No saved courses yet.',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: favoriteList.length,
                      itemBuilder: (context, index) {
                        final item = favoriteList[index];
                        final course = item['course']!;
                        final department = item['department']!;

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
                            subtitle: Text(
                              department,
                              style: const TextStyle(color: Colors.black54),
                            ),
                            leading: const Icon(Icons.bookmark, color: Colors.amber),
                            trailing: const Icon(Icons.open_in_new, size: 18),
                            onTap: () => _openPdf(department, course),
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

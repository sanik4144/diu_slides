import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/department_data.dart';
import 'department_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation<double> _scaleAnimation;
  bool _showWelcomeText = false;
  int _charIndex = 0;
  String _fullText = "Welcome to DIU Slides!";
  String _displayedText = "";

  @override
  void initState() {
    super.initState();

    // Button bounce effect
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(parent: _buttonController, curve: Curves.elasticOut);
    _buttonController.forward();

    // Simulated typewriter effect
    Future.delayed(const Duration(milliseconds: 500), _updateText);
  }

  void _updateText() {
    if (_charIndex < _fullText.length) {
      setState(() {
        _displayedText += _fullText[_charIndex];
        _charIndex++;
      });
      Future.delayed(const Duration(milliseconds: 100), _updateText);
    } else {
      _showWelcomeText = true;
    }
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _showWelcomeText ? 1.0 : 0.5,
                duration: const Duration(seconds: 1),
                child: Text(
                  _displayedText,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                child: _showWelcomeText
                    ? const Icon(Icons.school, size: 80, color: Colors.white, key: ValueKey(1))
                    : const Icon(Icons.auto_stories, size: 80, color: Colors.white54, key: ValueKey(2)),
              ),
              const SizedBox(height: 40),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Hero(
                  tag: 'dept-btn',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 10,
                      shadowColor: Colors.deepPurple,
                    ),
                    child: const Text('Go to Department'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (_) => DepartmentData(),
                            child: const DepartmentPage(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

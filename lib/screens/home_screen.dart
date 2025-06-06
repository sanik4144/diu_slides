import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/department_data.dart';
import 'department_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoOpacity;

  final String _fullText = "Welcome to SlideSpark!";
  String _displayedText = "";
  int _charIndex = 0;
  bool _showTagline = false;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(_logoController);
    _logoController.forward();

    Future.delayed(const Duration(milliseconds: 500), _typeText);

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => DepartmentData(),
            child: const DepartmentPage(),
          ),
        ),
      );
    });
  }

  void _typeText() {
    if (_charIndex < _fullText.length) {
      setState(() {
        _displayedText += _fullText[_charIndex];
        _charIndex++;
      });
      Future.delayed(const Duration(milliseconds: 80), _typeText);
    } else {
      _showTagline = true;
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0083B0), Color(0xFF00B4DB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo fade-in
              FadeTransition(
                opacity: _logoOpacity,
                child: Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/splash_logo.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Animated welcome text with modern font
              AnimatedOpacity(
                opacity: _charIndex > 0 ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  _displayedText,
                  style: GoogleFonts.quicksand(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.3,
                  ),
                ),
              ),

              // Tagline
              if (_showTagline)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Your gateway to organized academic slides',
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
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

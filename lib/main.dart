import 'package:flutter/material.dart';
import 'globals/favorites.dart'; // ✅ import this
import 'app.dart'; // ✅ import your app entry point

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadFavorites(); // 🔄 Load saved favorites
  runApp(MyApp());
}

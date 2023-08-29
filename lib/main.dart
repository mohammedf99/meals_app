import 'package:flutter/material.dart';

import './theme.dart';
import './screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: const CategoriesScreen(),
      home: const TabsScreen(),
    );
  }
}

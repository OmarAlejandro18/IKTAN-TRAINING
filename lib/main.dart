import 'package:flutter/material.dart';
import 'package:iktan_training/screens/screens.dart';
import 'package:iktan_training/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
        'user': (_) => const UserScreen(),
        'cursos': (_) => const CursosScreen(),
        'claseCurso': (_) => ClasesScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}

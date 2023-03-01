import 'package:flutter/material.dart';
import 'package:iktan_training/widgets/widgets.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Mis Cursos',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardSwipper(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final alto = size.height * 0.01;
    //final altoCtnr = size.height * 0.03;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Image.asset(
            'assets/iktan_training_logo.png',
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Iktan Training',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const Center(
            child: Text(
              '¿Quienes Somos?',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: size.height * 0.06,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Somos una empresa comprometida con tu conocimiento y crecimiento en la areas petroleras',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

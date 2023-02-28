import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final urlImg;
  final title;

  const CardMenu({super.key, required this.urlImg, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Hola mundo'),
      child: SizedBox(
        width: 120.0,
        height: 120.0,
        child: Card(
          color: const Color(0xffeab308),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    urlImg,
                    width: 64,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

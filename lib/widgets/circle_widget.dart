import 'package:flutter/material.dart';

class LlamandoCirculo extends StatelessWidget {
  const LlamandoCirculo({super.key});

  @override
  Widget build(BuildContext context) {

  final Size size = MediaQuery.of(context).size;
  final double amberSize = size.width * 0.8;
  final double amberSizeLight = size.width * 0.6;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child:Stack(
          children: [Positioned(
              top: -amberSizeLight * 0.2,
              left: -amberSizeLight * 0.2,
              child: CircleWidget(
                size: amberSizeLight,
                colors: const [
                  Color.fromARGB(62, 234, 178, 8),
                  Color.fromARGB(195, 234, 178, 8)
                ],
              ),
            ),
             Positioned(
              top: - amberSize * 0.2,
              right: -amberSize * 0.1,
              child: CircleWidget(
                size: amberSize,
                colors: const [
                  Color(0xffeab308),
                  Color(0xffeab308)
                ],
              ),
            ),
          ],
          ),
      ),
    );
  }
}


class CircleWidget extends StatelessWidget {
  final double size;
  final List<Color> colors;
  const CircleWidget(
    {super.key, 
    required this.size, 
    required this.colors})
    : assert(size != null && size > 0),
    assert(colors != null && colors.length >= 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
      ),
    );
  }
}
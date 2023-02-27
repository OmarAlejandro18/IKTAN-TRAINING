import 'package:flutter/material.dart';
import 'package:iktan_training/ux/ux.dart';
import 'package:iktan_training/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Background(),
            contenedorNeformismo(),
            containerLogo(),
            textosBienvenida(),
            //btnGetStarted(context),
            Container(
              height: 800,
              child: Column(
                children: [
                  const SizedBox(
                    height: 550,
                  ),
                  SnakeButton(
                    onTap: () => {Navigator.pushNamed(context, 'login')},
                    duration: const Duration(seconds: 2),
                    snakeColor: Colors.white,
                    borderColor: Colors.amber,
                    borderWith: 6.0,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Empecemos',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  MainShinyButtons()
                ],
              ),
            )
          ],
        ));
  }
}

Widget contenedorNeformismo() {
  return Column(
    children: [
      const SizedBox(
        height: 160,
      ),
      Center(
        child: Container(
          width: 330,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200, offset: const Offset(-7, -10)),
                const BoxShadow(color: Colors.white12, offset: Offset(5, 5))
              ]),
        ),
      ),
    ],
  );
}

Widget containerLogo() {
  return Column(
    children: [
      const SizedBox(
        height: 160,
      ),
      Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.only(top: 5),
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/Iktan_Training.png',
            ),
          ),
        ),
      ),
    ],
  );
}

Widget textosBienvenida() {
  return Center(
    child: Column(
      children: [
        const SizedBox(
          height: 380,
        ),
        Text(
          'BIENVENIDO',
          style: TextStyle(fontSize: 48, color: Color(0xFFF8B333), shadows: [
            Shadow(
                offset: const Offset(1, 1),
                color: const Color(0xFFF8B333).withOpacity(0.80),
                blurRadius: 2),
            Shadow(
                offset: const Offset(1, 1),
                color: const Color(0xFFF8B333).withOpacity(0.85),
                blurRadius: 2)
          ]),
        ),
        const Text(
          'POR FAVOR INICIA SESIÓN PARA USAR LA APLICACIÓN',
          style: TextStyle(fontSize: 11),
        )
      ],
    ),
  );
}

Widget btnGetStarted(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 560,
      ),
      Center(
          child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          onPressed: () => {Navigator.pushNamed(context, 'login')},
          child: const Text('Comencemos'),
        ),
      ))
    ],
  );
}

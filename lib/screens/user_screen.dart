import 'package:flutter/material.dart';
import 'package:iktan_training/widgets/widgets.dart';
import '../widgets/circle_widget.dart';

enum _MenuValues { editPerf, editCont, ncias }

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          LlamandoCirculo(),
          AvatarUser(),
          UserBottonMenu(),
        ],
      ),
    );
  }
}

class AvatarUser extends StatelessWidget {
  const AvatarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 160,
      ),
      Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              borderRadius: BorderRadius.circular(100)),
          width: 140,
          height: 120,
          child:  Image(
            image: AssetImage('assets/acerca_de.png'),
          )
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'andres cruz',
        style: TextStyle(fontSize: 18),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'usuario852@gmail.com',
        style: TextStyle(color: Colors.black45),
      )
    ]);
  }
}

class UserBottonMenu extends StatelessWidget {
  const UserBottonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 320,
            ),
            PopupMenuButton<_MenuValues>(
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: _MenuValues.editPerf,
                  child: Text('actualizar datos de perfil'),
                ),
                const PopupMenuItem(
                  value: _MenuValues.editCont,
                  child: Text('actualizar contraseña'),
                ),
                const PopupMenuItem(
                  value: _MenuValues.ncias,
                  child: Text('datos para ncias'),
                ),
              ],
              elevation: 0,
              color: Colors.white,
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
              iconSize: 40,
              onSelected: (value) {
                switch (value) {
                  case _MenuValues.editPerf:
                    print('Enviar a editar perfil');
                    break;
                  case _MenuValues.editCont:
                    print('Enviar a editar aseña');
                    break;
                  case _MenuValues.ncias:
                    print('Enviar a ncias');
                    break;
                }
              },
            ),
          ],
        ),
        const SizedBox(
          height: 250,
        ),
        const MenuDashboard()
      ],
    );
  }
}

class MenuDashboard extends StatelessWidget {
  const MenuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: [
              CardMenu(
                urlImg: 'assets/curso-online.png',
                title: 'Mis Cursos',
                onTap: () => Navigator.pushNamed(context, 'cursos'),
              ),
              CardMenu(
                urlImg: 'assets/constancias.png',
                title: 'Constancias',
                onTap: () => {print('hola desde constancias')},
              ),
              CardMenu(
                urlImg: 'assets/validador.png',
                title: 'Validador',
                onTap: () => {print('hola desde validador')},
              ),
              CardMenu(
                urlImg: 'assets/acerca_de.png',
                title: 'Acerca de',
                onTap: () => {print('hola desde acerca de')},
              ),
              CardMenu(
                urlImg: 'assets/contactos.png',
                title: 'Contacto',
                onTap: () => {print('hola desde contacto')},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

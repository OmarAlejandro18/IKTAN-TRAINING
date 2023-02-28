import 'package:flutter/material.dart';
import 'package:iktan_training/widgets/widgets.dart';
import '../widgets/circle_widget.dart';

enum _MenuValues { editPerf, editCont, ncias }

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LlamandoCirculo(),
          AvatarUser(),
          UserBottonMenu(),
        ],
      ),
    );
  }
}

class AvatarUser extends StatelessWidget {
  AvatarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 160,
      ),
      Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 5, color: Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.circular(100)),
          width: 140,
          child: Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'andres cruz',
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'usuario852@gmail.com',
        style: TextStyle(color: Colors.black45),
      )
    ]);
  }
}

class UserBottonMenu extends StatelessWidget {
  UserBottonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            SizedBox(
              width: 320,
            ),
            PopupMenuButton<_MenuValues>(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: _MenuValues.editPerf,
                  child: Text('actualizar datos de perfil'),
                ),
                PopupMenuItem(
                  value: _MenuValues.editCont,
                  child: Text('actualizar contraseña'),
                ),
                PopupMenuItem(
                  value: _MenuValues.ncias,
                  child: Text('datos para ncias'),
                ),
              ],
              elevation: 0,
              color: Colors.white,
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
        SizedBox(
          height: 250,
        ),
        MenuDashboard()
      ],
    );
  }
}

class MenuDashboard extends StatelessWidget {
  MenuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: const [
              CardMenu(urlImg: 'assets/mis_cursos.png', title: 'Mis Cursos'),
              CardMenu(
                  urlImg: 'assets/mis_constancias.png', title: 'Constancias'),
              CardMenu(urlImg: 'assets/validador.png', title: 'Validador'),
              CardMenu(urlImg: 'assets/acerca-de.png', title: 'Acerca de'),
              CardMenu(urlImg: 'assets/contactos.png', title: 'Contacto'),
            ],
          ),
        ),
      ),
    );
  }
}

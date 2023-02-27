import 'package:flutter/material.dart';
import '../widgets/circle_widget.dart';

enum _MenuValues {
  editPerf,
  editCont,
  constancias
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
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
    return Column(
        children: [
           const SizedBox(
            height: 160,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.circular(100)
              ),
              width:  140,
              child: const Image(
                image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
                ),
              ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('andres cruz', style: TextStyle(fontSize: 18),),
          const SizedBox(
            height: 10,
          ),
          Text('usuario852@gmail.com', style: TextStyle(color: Colors.black45),)
        ]
      );
  }
}


class UserBottonMenu extends StatelessWidget {
  const UserBottonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(width: 320,),
              PopupMenuButton <_MenuValues> 
              (itemBuilder: (BuildContext context) =>
              const [
                PopupMenuItem(value: _MenuValues.editPerf,child: Text('actualizar datos de perfil'),),
                PopupMenuItem(value: _MenuValues.editCont,child: Text('actualizar contraseña'),),
                PopupMenuItem(value: _MenuValues.constancias,child: Text('datos para constancias'),),
              ],
              elevation: 0,
              color: Colors.white,
              iconSize: 40,
              onSelected: (value){
                  switch (value) {
                    case _MenuValues.editPerf : 
                      print('Enviar a editar perfil');
                      break;
                    case _MenuValues.editCont :
                      print('Enviar a editar constraseña');
                      break;
                    case _MenuValues.constancias :
                      print('Enviar a constancias');
                      break;
                  }
                },
              ),
            ],
          ),
        ],
    );
  }
}






import 'package:flutter/material.dart';
import 'package:iktan_training/theme/app_theme.dart';
import 'package:iktan_training/ux/ux.dart';

class FormularioContrasenaScreen extends StatelessWidget {
  const FormularioContrasenaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GloboCliper(
              color: Color.fromARGB(100, 248, 178, 51),
              pTop: 60,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          const GloboCliper(
              color: AppTheme.primary,
              pTop: 0,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 170,
                ),
                const TextosFormularioC(),
                const SizedBox(
                  height: 20,
                ),
                FormularioDeContrasena(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextosFormularioC extends StatelessWidget {
  const TextosFormularioC({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Datos de Contraseña',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 60),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class FormularioDeContrasena extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final contrasena = TextEditingController();
  final nuevaContras = TextEditingController();
  final confirmNuevaContra = TextEditingController();

  FormularioDeContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                      child: Text(
                        'Contraseña Actual',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoContrasena(contrasena),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 15, top: 15),
                      child: Text(
                        'Nueva Contraseña',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoNuevaContrasena(nuevaContras),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 15, top: 15),
                      child: Text(
                        'Confirmar Contraseña',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoConfirmarContrasena(confirmNuevaContra),
                    const SizedBox(
                      height: 20,
                    ),
                    botonActualizarContra(
                        context, contrasena, nuevaContras, confirmNuevaContra),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget campoContrasena(TextEditingController contrasena) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.baseBlanca,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, -4),
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: contrasena,
        obscureText: true,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock,
            color: AppTheme.primary,
          ),
          hintText: 'Contraseña Actual',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {print("apagar boton")},
            child: const Icon(
              Icons.visibility,
              size: 30,
              color: AppTheme.primary,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget campoNuevaContrasena(TextEditingController nuevaContras) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.baseBlanca,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, -4),
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: nuevaContras,
        obscureText: true,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock_sharp,
            color: AppTheme.primary,
          ),
          hintText: 'Ingrese la nueva contraseña',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {print("apagar boton")},
            child: const Icon(
              Icons.visibility,
              size: 30,
              color: AppTheme.primary,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget campoConfirmarContrasena(TextEditingController confirmNuevaContra) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.baseBlanca,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, -4),
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: confirmNuevaContra,
        obscureText: true,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock_sharp,
            color: AppTheme.primary,
          ),
          hintText: 'Confirmar contraseña',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {print("apagar boton")},
            child: const Icon(
              Icons.visibility,
              size: 30,
              color: AppTheme.primary,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget botonActualizarContra(
    BuildContext context,
    TextEditingController contrasena,
    TextEditingController nuevaContras,
    TextEditingController confirmNuevaContra) {
  return GestureDetector(
    onTap: () => {
      print('el valor de contra es: ${contrasena.text}'),
      print('el valor de passw es: ${nuevaContras.text}'),
      Navigator.pop(context),
      contrasena.text = '',
      nuevaContras.text = '',
      confirmNuevaContra.text = ''
    },
    child: Padding(
      padding: const EdgeInsets.only(
        left: 220,
      ),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(0xfff7b858),
              Color(0xfff7b858),
            ],
          ),
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 25,
            ),
            Text(
              'Actualizar',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppTheme.baseBlanca),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppTheme.baseBlanca,
            )
          ],
        ),
      ),
    ),
  );
}

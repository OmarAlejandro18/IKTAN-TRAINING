import 'package:flutter/material.dart';
import 'package:iktan_training/providers/providers.dart';
import 'package:iktan_training/theme/app_theme.dart';
import 'package:iktan_training/ux/ux.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GloboCliper(
              color: AppTheme.primary.withOpacity(0.4),
              pTop: 50,
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
                const TextosLogin(),
                const SizedBox(
                  height: 40,
                ),
                LoginFormulario(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextosLogin extends StatelessWidget {
  const TextosLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '¡Hola!',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 80),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 14, top: 10),
          child: Text('Inicia Sesión en tu cuenta',
              textAlign: TextAlign.start, style: TextStyle(fontSize: 22)),
        )
      ],
    );
  }
}

class LoginFormulario extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final contrasena = TextEditingController();

  LoginFormulario({super.key});

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
                        padding:
                            EdgeInsets.only(left: 25, right: 25, bottom: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      campoEmail(email),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 25, right: 25, bottom: 10),
                        child: Text(
                          'Contraseña',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      campoPassword(context, contrasena),
                      const SizedBox(
                        height: 40,
                      ),
                      botonLogin(context, email, contrasena),
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}

Widget campoEmail(TextEditingController email) {
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
        controller: email,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.email,
            color: AppTheme.primary,
          ),
          hintText: 'Correo electronico',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoPassword(BuildContext context, TextEditingController contrasena) {
  final esOculto1 = Provider.of<BotonContrasena>(context);
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
        obscureText: esOculto1.oculto,
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
          hintText: 'Contraseña',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {esOculto1.esOculto = !esOculto1.oculto},
            child: esOculto1.oculto
                ? const Icon(
                    Icons.visibility_off,
                    size: 30,
                    color: AppTheme.primary,
                  )
                : const Icon(
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

Widget botonLogin(BuildContext context, TextEditingController email,
    TextEditingController contrasena) {
  return GestureDetector(
    onTap: () => {
      print('el valor de usu es: ${email.text}'),
      print('el valor de passw es: ${contrasena.text}'),
      email.text = '',
      contrasena.text = '',
      Navigator.pushNamed(context, 'user'),
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 220, bottom: 30),
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
              width: 35,
            ),
            Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppTheme.baseBlanca,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppTheme.baseBlanca,
            ),
          ],
        ),
      ),
    ),
  );
}

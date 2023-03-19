import 'package:flutter/material.dart';
import 'package:iktan_training/providers/providers.dart';
import 'package:iktan_training/screens/screens.dart';
import 'package:iktan_training/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BotonContrasena()),
        ChangeNotifierProvider(create: (context) => BotonContrasenaActual()),
        ChangeNotifierProvider(create: (context) => BotonNuevaContrasena()),
        ChangeNotifierProvider(create: (context) => BotonConfirmarContrasena())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'login': (_) => const LoginScreen(),
          'user': (_) => const UserScreen(),
          'cursos': (_) => const CursosScreen(),
          'claseCurso': (_) => ClasesScreen(),
          'formularioPerfil': (_) => const FormularioPerfilScreen(),
          'formularioContrasena': (_) => const FormularioContrasenaScreen(),
          'formularioConstancia': (_) => const FormularioContanciaScreen(),
          'acercaDe': (_) => const AcercaDeScreen(),
          'detallesCurso': (_) => const DetallesClase(),
          'constancias': (_) => const ConstanciasScreen(),
          'contactanos': (_) => const ContactanosScreen()
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetallesClase extends StatelessWidget {
  const DetallesClase({super.key});

  @override
  Widget build(BuildContext context) {
    var parametros = ModalRoute.of(context)!.settings.arguments;
    return SilverAppBar(id: parametros);
  }
}

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({
    super.key,
    required this.id,
  });

  final dynamic id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Center(child: Text('Sliver AppBar $id')),
            expandedHeight: 200,
            flexibleSpace: Image.network('https://img.freepik.com/vector-premium/paisaje-nocturno-luna-llena-grandes-arboles_104785-151.jpg',
            fit: BoxFit.cover,),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:iktan_training/theme/app_theme.dart';

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
          _CustomAppBar(id: id),
          // const SliverTabBar()
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    required this.id,
  });

  final dynamic id;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            'Titulo de la Clase $id',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'http://www.panavision-tours.com/viajes/paisajes-de-islandia/islandia-turismo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class SliverTabBar extends StatelessWidget {
  const SliverTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      primary: false,
      elevation: 8.0,
      backgroundColor: Colors.deepPurple,
      title: Align(
        alignment: AlignmentDirectional.center,
        child: TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'Lobos'),
            Tab(text: 'Tigres',),
          ],
        ),
      ),
    ) ;
  }
}
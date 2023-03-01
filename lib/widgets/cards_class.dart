import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:iktan_training/theme/app_theme.dart';

class CursosClass extends StatefulWidget {
  const CursosClass({super.key});

  @override
  State<CursosClass> createState() => _CursoClassState();
}

class _CursoClassState extends State<CursosClass> {
  final _pageController = PageController(
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clases Curso'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) => _builder(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Changes here only
  _builder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        //print('el valor de index es ${index}');
        double value = 1.0;
        //print('el valor de value es ${value}');

        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          //print('el valor de value en la primera condicion es ${value}');
          if (value >= 0) {
            //print('el valor de value en el segundo if es ${value}');
            double _lowerLimit = 0;
            double _upperLimit = math.pi / 2;

            //print('el valor de _lowerLimit es ${_lowerLimit}');
            //print('el valor de _upperLimit es ${_upperLimit}');

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);

            //print('el valor de value en la primera operacion es ${value}');
            value = _upperLimit - value;
            //print('el valor de value en la segunda operacion es ${value}');
            value *= -1;
            //print('el valor de value en la tercera operacion operacion es ${value}');
          }
        } else {
          //Won't work properly in case initialPage in changed in PageController
          if (index == 0) {
            value = 0;
          } else if (index == 1) {
            value = -1;
          }
        }

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(value),
          alignment: Alignment.center,
          child: Card(
            i: index,
          ),
        );
      },
      child: Card(
        i: index,
      ),
    );
  }
}

class Card extends StatelessWidget {
  final int i;
  const Card({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('hola mundo desde i: ${i}'),
      child: Container(
        margin: const EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: const Center(
            child: Text(
          'Card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final height;

  const HeaderWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, height),
            Offset(width / 10 * 5, height - 60),
            Offset(width / 5 * 4, height + 20),
            Offset(width, height - 18)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 255, 193, 7).withOpacity(0.4),
                    const Color.fromARGB(255, 255, 193, 7).withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 3, height + 20),
            Offset(width / 10 * 8, height - 60),
            Offset(width / 5 * 4, height - 60),
            Offset(width, height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 255, 193, 7).withOpacity(0.4),
                    Colors.amber.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, height),
            Offset(width / 2, height - 40),
            Offset(width / 5 * 4, height - 80),
            Offset(width, height - 20)
          ]),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 193, 7),
                    Color.fromARGB(255, 255, 193, 7),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        Column(
          children: const [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: SizedBox(
                child: Text("BIENVENIDO A",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];

  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

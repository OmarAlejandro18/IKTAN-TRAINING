import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButton extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color snakeColor;
  final Color borderColor;
  final double borderWith;
  final VoidCallback onTap;

  const SnakeButton(
      {super.key,
      required this.child,
      required this.duration,
      required this.snakeColor,
      required this.borderColor,
      required this.borderWith,
      required this.onTap});

  @override
  State<SnakeButton> createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller!.repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: CustomPaint(
          painter: SnakePainter(
            animation: _controller,
            borderColor: widget.borderColor,
            borderWith: widget.borderWith,
            snakeColor: widget.snakeColor,
          ),
          child: Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class SnakePainter extends CustomPainter {
  final animation;
  final Color snakeColor;
  final Color borderColor;
  final double borderWith;

  SnakePainter(
      {required this.snakeColor,
      required this.borderColor,
      required this.borderWith,
      required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = SweepGradient(
        colors: [snakeColor, borderColor],
        stops: const [0.7, 1.0],
        startAngle: 0,
        endAngle: vector.radians(80),
        transform:
            GradientRotation(vector.radians(360.toDouble() * animation.value)),
      ).createShader(rect);

    final path = Path.combine(
      PathOperation.xor,
      Path()..addRect(rect),
      Path()..addRect(rect.deflate(borderWith)),
    );
    //path.addRect(rect);

    canvas.drawRect(
        rect.deflate(borderWith / 2),
        Paint()
          ..color = borderColor
          ..strokeWidth = borderWith
          ..style = PaintingStyle.stroke);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SnakePainter oldDelegate) => true;
}

class MainShinyButtons extends StatelessWidget {
  const MainShinyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        children: [
          ShinyButton(
            child: Text(
              "Hola mundo",
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.amber,
            onTap: () => {print("Hola mundo")},
          ),
        ],
      ),
    );
  }
}

class ShinyButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onTap;

  const ShinyButton(
      {super.key,
      required this.color,
      required this.onTap,
      required this.child});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              child: widget.child,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.color,
                    Colors.white,
                    widget.color,
                  ],
                  stops: [
                    0.0,
                    _controller.value,
                    1.0,
                  ],
                ),
              ),
            );
          }),
    );
  }
}

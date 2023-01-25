import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _CuadradoAnimado());
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> enlarge;
  late Animation<double> moveRight;

  @override
  initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 4 * math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut)));
    enlarge = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    moveRight = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0.0),
          child: Transform.scale(
            scale: enlarge.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.rotate(
                  angle: rotation.value, child: const _Rectangulo()),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 90,
        width: 90,
        decoration: const BoxDecoration(color: Colors.red),
      ),
    );
  }
}

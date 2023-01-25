import 'package:flutter/material.dart';

class AnimationRectanguloScreen extends StatelessWidget {
  const AnimationRectanguloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _AnimationRectangulo());
  }
}

class _AnimationRectangulo extends StatefulWidget {
  const _AnimationRectangulo({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimationRectangulo> createState() => _AnimationRectanguloState();
}

class _AnimationRectanguloState extends State<_AnimationRectangulo>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? moveRight;
  Animation<double>? moveTop;
  Animation<double>? moveLeft;
  Animation<double>? moveBottom;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moveTop = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));

    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));

    moveBottom = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    animationController!.forward();
    animationController!.addListener(() {
      if (animationController!.status == AnimationStatus.completed) {
        animationController!.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(moveRight!.value + moveLeft!.value,
                moveTop!.value + moveBottom!.value),
            child: _Rectangulo(),
          );
        });
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 70,
        color: Colors.deepPurple,
      ),
    );
  }
}

import 'package:design_app/src/widget/header.dart';
import 'package:design_app/src/widget/header_border.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HeaderBorder());
  }
}

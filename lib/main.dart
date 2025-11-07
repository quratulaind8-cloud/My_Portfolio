import 'package:flutter/material.dart';
import 'package:flutter_application_2/header.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PortfolioHeader(),
    );
  }
}

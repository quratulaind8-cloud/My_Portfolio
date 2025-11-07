import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final Function(GlobalKey) scrollToSection; // receive function
  final GlobalKey projectKey; // receive key

  const HomePage({
    super.key,
    required this.scrollToSection,
    required this.projectKey,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    final bool isDesktop = screenWidth >= 1024;

    double headingSize = isMobile
        ? 24
        : isTablet
        ? 32
        : 40;

    double subHeadingSize = isMobile
        ? 18
        : isTablet
        ? 22
        : 26;

    double normalTextSize = isMobile
        ? 13
        : isTablet
        ? 14
        : 16;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isMobile ? 90 : 0),

          // ===== Intro Text =====
          Text(
            "Hi, I'm Qurat-Ul-Ain Dawood",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.purpleAccent,
              fontSize: subHeadingSize,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10),
          Text(
            "FLUTTER MOBILE APP DEVELOPER",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: headingSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),

          Text(
            "AND UI/UX ENTHUSIAST.",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: headingSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 15),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            alignment: Alignment.center,
            child: Text(
              "I build high-performance, cross-platform apps with Flutter and Firebase.\n"
              "My focus is on creating beautiful, functional, and responsive user experiences.",
              style: GoogleFonts.poppins(
                color: Colors.grey[400],
                fontSize: normalTextSize,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 30),

          // ===== View Projects Button =====
          ElevatedButton(
            onPressed: () => scrollToSection(projectKey),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 25 : 40,
                vertical: isMobile ? 12 : 18,
              ),
              shape: StadiumBorder(),
              elevation: 5,
            ),
            child: Text(
              "View My Work",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    // Grid column count based on device size
    int crossAxisCount = isMobile
        ? 2
        : isTablet
        ? 3
        : 4;

    // Responsive padding for outer layout
    final outerPadding = EdgeInsets.symmetric(
      horizontal: isMobile
          ? 20
          : isTablet
          ? 60
          : 100,
      vertical: isMobile ? 40 : 80,
    );

    // Responsive title size
    final titleFontSize = isMobile
        ? 22.0
        : isTablet
        ? 26.0
        : 32.0;

    return Padding(
      padding: outerPadding,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 30 : 50,
          horizontal: isMobile ? 15 : 30,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF111111),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 183, 117, 255).withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 3,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== Title =====
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "MY ",
                    style: GoogleFonts.poppins(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: "SKILLS",
                    style: GoogleFonts.poppins(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 183, 117, 255),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // ===== Skills Grid =====
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 20 : 40,
              mainAxisSpacing: isMobile ? 20 : 40,
              childAspectRatio: isMobile ? 1.2 : 1,
              children: const [
                _SkillBox(title: "Flutter"),
                _SkillBox(title: "Dart"),
                _SkillBox(title: "UI/UX Design"),
                _SkillBox(title: "Git & GitHub"),
                _SkillBox(title: "C++"),
                _SkillBox(title: "OOP"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ====== Individual Skill Box ======
class _SkillBox extends StatelessWidget {
  final String title;

  const _SkillBox({required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 183, 117, 255).withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 14 : 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

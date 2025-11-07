import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    // Number of columns depending on screen
    int crossAxisCount = isMobile
        ? 3
        : isTablet
        ? 3
        : 4;

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
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
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "MY ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: "SKILLS",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // ===== Grid of Skill Containers =====
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: 1,
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

// ====== Skill Container Widget ======
class _SkillBox extends StatelessWidget {
  final String title;

  const _SkillBox({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.5),
            blurRadius: 15,
            spreadRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

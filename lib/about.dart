import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ---- Responsive breakpoints using MediaQuery ----
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isLaptop = screenWidth >= 1024;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            // ======= Heading =======
            Text(
              "About Me",
              style: GoogleFonts.montserrat(
                color: Colors.purpleAccent,
                fontSize: isMobile
                    ? 26
                    : isTablet
                    ? 30
                    : 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 20
                    : isTablet
                    ? 60
                    : 30,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20 // mobile
                      : isTablet
                      ? 60 // tablet
                      : 80, // desktop
                  vertical: isMobile ? 10 : 20,
                ),

                child: Text(
                  "Hi! I’m Qurat-ul-Ain, a BSCS student and an aspiring Flutter developer who loves creating clean, responsive, and user-friendly mobile apps. I enjoy transforming creative ideas into real-world applications that solve everyday problems. My passion for app development began with curiosity about how technology shapes our daily lives. Since then, I’ve been learning Flutter, exploring UI/UX design, and building projects that help me grow as a developer. I’m always eager to learn, experiment, and take on new challenges that improve my skills and creativity.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: isMobile
                        ? 14
                        : isTablet
                        ? 16
                        : 18,
                    height: 1.6,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),

            // ======= Stats Container =======
            Container(
              width: isMobile
                  ? screenWidth * 0.9
                  : isTablet
                  ? screenWidth * 0.6
                  : 900,
              padding: EdgeInsets.symmetric(
                vertical: isMobile
                    ? 50
                    : isTablet
                    ? 50
                    : 20,
                horizontal: isMobile
                    ? 40
                    : isTablet
                    ? 40
                    : 20,
              ),

              decoration: BoxDecoration(
                color: Color(0xFF111111),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 40,
                    spreadRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
                border: Border.all(color: Colors.white12, width: 1),
              ),

              //--------------------Row or Column-----------
              child: isMobile
                  ? Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        _StatColumn(
                          value: "1+",
                          label1: "Years of",
                          label2: "Experience",
                        ),
                        SizedBox(height: 25),

                        _StatColumn(
                          value: "25+",
                          label1: "Satisfied",
                          label2: "Clients",
                        ),
                        SizedBox(height: 25),

                        _StatColumn(
                          value: "15+",
                          label1: "Projects",
                          label2: "Done",
                        ),
                        SizedBox(height: 25),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _StatColumn(
                          value: "1+",
                          label1: "Years of",
                          label2: "Experience",
                        ),

                        _StatColumn(
                          value: "25+",
                          label1: "Satisfied",
                          label2: "Clients",
                        ),

                        _StatColumn(
                          value: "15+",
                          label1: "Projects",
                          label2: "Done",
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======= Stat Column Widget =======
class _StatColumn extends StatelessWidget {
  final String value;
  final String label1;
  final String label2;

  const _StatColumn({
    required this.value,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isLaptop = screenWidth >= 1024;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ======= Number + "+" =======
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value.replaceAll('+', ''),
                style: GoogleFonts.poppins(
                  fontSize: isMobile
                      ? 34
                      : isTablet
                      ? 38
                      : 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: '+',
                style: GoogleFonts.poppins(
                  fontSize: isMobile
                      ? 28
                      : isTablet
                      ? 32
                      : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent.shade100,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        // ======= Labels =======
        Text(
          "$label1\n$label2",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: isMobile
                ? 13
                : isTablet
                ? 15
                : 16,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // ✅ fixed here
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isLaptop = screenWidth >= 1024;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.school, size: 34, color: Colors.purpleAccent),
          const SizedBox(width: 8),
          Text(
            'Education',
            style: GoogleFonts.montserrat(
              color: Colors.purpleAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),

          // ✅ Responsive Layout
          if (isLaptop) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _EducationCard(
                  degree: "Matriculation in Science",
                  institute: "Excel School",
                  year: "2019 – 2021",
                  description:
                      "Focused on science fundamentals, logical reasoning, and analytical thinking.",
                ),
                _EducationCard(
                  degree: "Intermediate (Computer Science)",
                  institute: "Himayat-E-Islam Degree College",
                  year: "2021 – 2023",
                  description:
                      "Built a foundation in programming, algorithms, and problem-solving.",
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _EducationCard(
                  degree: "BS in Computer Science",
                  institute: "Lahore College for Women University",
                  year: "2023 – 2027",
                  description:
                      "Focusing on app development, UI/UX design, and modern frameworks like Flutter.",
                ),
              ],
            ),
          ] else ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _EducationCard(
                  degree: "Matriculation in Science",
                  institute: "Excel School lahore",
                  year: "2019 – 2021",
                  description:
                      "Learned core science concepts and improved logical thinking skills.",
                ),

                SizedBox(height: 80),
                _EducationCard(
                  degree: "Intermediate (Computer Science)",
                  institute: "Himayat-E-Islam Degree College",
                  year: "2021 – 2023",
                  description:
                      "Built a foundation in programming, algorithms, and problem-solving.",
                ),

                SizedBox(height: 80),
                _EducationCard(
                  degree: "BS in Computer Science",
                  institute: "Lahore College for Women University",
                  year: "2023 – 2027",
                  description:
                      "Focusing on app development, UI/UX design, and modern frameworks like Flutter.",
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String degree;
  final String institute;
  final String year;
  final String description;

  const _EducationCard({
    required this.degree,
    required this.institute,
    required this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 40,
            spreadRadius: 3,
          ),
        ],
        border: Border.all(color: Colors.white12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            institute,
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            year,
            style: GoogleFonts.poppins(
              color: Colors.purpleAccent,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.poppins(
              color: Colors.white60,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

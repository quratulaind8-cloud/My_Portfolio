import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),

      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 183, 117, 255).withOpacity(0.3),

              //color: Colors.purple.withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ======= Title =======
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "LATEST ",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: "PROJECTS",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 183, 117, 255),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Text(
              "A glimpse into my work — blending creativity with clean, efficient code.\n"
              "These projects reflect my journey as a developer, focusing on functionality, aesthetics, and user experience.",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30),

            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _projectCard("assets/project1.jpg"),
                _projectCard("assets/project2.jpg"),
                _projectCard("assets/project3.jpg"),
                _projectCard("assets/project4.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectCard(String imagePath) {
    return Container(
      width: 250,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

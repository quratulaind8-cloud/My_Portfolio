import 'package:flutter/material.dart';
import 'package:flutter_application_2/about.dart';
import 'package:flutter_application_2/bottom.dart';
import 'package:flutter_application_2/contact.dart';
import 'package:flutter_application_2/education.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/projects.dart';
import 'package:flutter_application_2/skills.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeKey = GlobalKey();
    var aboutKey = GlobalKey();
    var educationKey = GlobalKey();
    var skillsKey = GlobalKey();
    var projectKey = GlobalKey();
    var contactKey = GlobalKey();

    void scrollToSection(GlobalKey key) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }

    var size = MediaQuery.of(context).size;
    var isMobile = size.width < 600;
    var isTablet = size.width >= 600 && size.width < 1000;
    var isDesktop = size.width >= 1000;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Qurat-UL-Ain Dawood',
          style: GoogleFonts.poppins(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.purpleAccent),
        actions: (isDesktop || isTablet)
            ? [
                Row(
                  children: [
                    InkWell(
                      onTap: () => scrollToSection(homeKey),
                      splashColor: Colors.purpleAccent,

                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          'Home',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () => scrollToSection(aboutKey),
                      splashColor: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        child: Text(
                          'About',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () => scrollToSection(educationKey),
                      splashColor: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        child: Text(
                          'Education',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => scrollToSection(skillsKey),
                      splashColor: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        child: Text(
                          'Skills',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () => scrollToSection(projectKey),
                      splashColor: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        child: Text(
                          'Projects',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(width: 20),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                        ),
                        onPressed: () => scrollToSection(contactKey),
                        child: Text(
                          "Let's Talk",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            : null,
      ),

      drawer: isMobile
          ? Drawer(
              backgroundColor: Colors.black,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.purpleAccent),
                    child: Text(
                      'Menu',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Home',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purpleAccent,
                    ),
                    onTap: () => scrollToSection(homeKey),
                  ),
                  ListTile(
                    title: Text(
                      'About',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purpleAccent,
                    ),
                    onTap: () => scrollToSection(aboutKey),
                  ),
                  ListTile(
                    title: Text(
                      'Education',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purpleAccent,
                    ),
                    onTap: () => scrollToSection(educationKey),
                  ),
                  ListTile(
                    title: Text(
                      'Skills',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purpleAccent,
                    ),
                    onTap: () => scrollToSection(skillsKey),
                  ),
                  ListTile(
                    title: Text(
                      'Projects',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purpleAccent,
                    ),
                    onTap: () => scrollToSection(projectKey),
                  ),

                  ListTile(
                    title: Text(
                      'Contact',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purpleAccent,
                    ),
                    onTap: () => scrollToSection(contactKey),
                  ),
                ],
              ),
            )
          : null,
      //-----------------------------body------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: homeKey,
              child: HomePage(
                scrollToSection: scrollToSection,
                projectKey: projectKey,
              ),
            ),
            SizedBox(height: 40),
            Container(key: aboutKey, child: AboutPage()),

            SizedBox(height: 50),
            Container(key: educationKey, child: EducationSection()),

            SizedBox(height: 35),
            Container(key: skillsKey, child: SkillsSection()),

            SizedBox(height: 35),
            Container(key: projectKey, child: ProjectsSection()),

            SizedBox(height: 50),
            Container(key: contactKey, child: ContactForm()),

            SizedBox(height: 30),
            Divider(color: Colors.white),

            ContactPage(),
          ],
        ),
      ),
    );
  }
}

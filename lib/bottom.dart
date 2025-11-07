import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Email launcher
  void _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'quratulaind@8gmail.com',
      queryParameters: {
        'subject': 'Hello Qurat-Ul-Ain',
        'body': 'Hi! I want to connect with you!',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.platformDefault);
    } else {
      debugPrint('Could not launch email app');
    }
  }

  // Phone launcher
  void _callPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+923226691939');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri, mode: LaunchMode.platformDefault);
    } else {
      debugPrint('Could not launch phone app');
    }
  }

  //(Google Maps)
  void _openLocation() async {
    final Uri mapUri = Uri.parse('https://maps.google.com/?q=Lahore+Pakistan');
    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri, mode: LaunchMode.platformDefault);
    } else {
      debugPrint('Could not open location');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    bool isMobile = size.width < 600;
    bool isTablet = size.width >= 600 && size.width < 1000;
    bool isDesktop = size.width >= 1000;

    return Column(
      children: [
        Text(
          "Contact Me",
          style: GoogleFonts.montserrat(
            color: Colors.purpleAccent,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 20),

        // ---------- Contact Info ----------
        Padding(
          padding: const EdgeInsets.all(20),
          child: (isDesktop || isTablet)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildContactItem(
                      icon: Icons.email,
                      label: "Email",
                      value: "quratulaind8@gmail.com",
                      onTap: _sendEmail,
                    ),
                    _buildContactItem(
                      icon: Icons.phone,
                      label: "Phone",
                      value: "+92 322 6691939",
                      onTap: _callPhone,
                    ),
                    _buildContactItem(
                      icon: Icons.location_on,
                      label: "Location",
                      value: "Lahore, Pakistan",
                      onTap: _openLocation,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContactItem(
                      icon: Icons.email,
                      label: "Email",
                      value: "quratulaind8@gmail.com",
                      onTap: _sendEmail,
                    ),
                    SizedBox(height: 15),
                    _buildContactItem(
                      icon: Icons.phone,
                      label: "Phone",
                      value: "+92 322 6691939",
                      onTap: _callPhone,
                    ),
                    SizedBox(height: 15),
                    _buildContactItem(
                      icon: Icons.location_on,
                      label: "Location",
                      value: "Lahore, Pakistan",
                      onTap: _openLocation,
                    ),
                  ],
                ),
        ),

        SizedBox(height: 20),

        // ---------- Footer ----------
        Text(
          "© 2025 Qurat-Ul-Ain. All Rights Reserved.",
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  // ---------- Reusable Contact Item ----------
  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.purpleAccent, size: 30),
          SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Submit Function with Validation
  void _submitForm() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final subject = subjectController.text.trim();
    final message = messageController.text.trim();
    final whatsappNumber = '+923226691939';
    final encodedMessage = Uri.encodeComponent(
      "Hello, my name is $name.\nSubject: $subject\n$message",
    );
    final whatsappUrl = Uri.parse(
      "https://wa.me/$whatsappNumber?text=$encodedMessage",
    );

    //Check if any field is empty
    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        subject.isEmpty ||
        message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("⚠️ Please enter all required data!"),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("✅ Message sent successfully!"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );

    if (await canLaunchUrl(whatsappUrl)) {
      launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Could not open WhatsApp!"),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    // Optional: print & clear fields
    print("Full Name: $name");
    print("Email: $email");
    print("Phone: $phone");
    print("Subject: $subject");
    print("Message: $message");

    nameController.clear();
    emailController.clear();
    phoneController.clear();
    subjectController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1000;

    double containerWidth = isMobile
        ? screenWidth * 0.9
        : isTablet
        ? screenWidth * 0.75
        : 900;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ---------- Title ----------
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "LET’S COLLABORATE & ",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "DESIGN.",
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // ---------- Form Fields ----------
              if (isMobile) ...[
                _buildTextField("Full Name", nameController),
                SizedBox(height: 20),
                _buildTextField(
                  "Email",
                  emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  "Phone",
                  phoneController,
                  type: TextInputType.phone,
                ),
                SizedBox(height: 20),
                _buildTextField("Subject", subjectController),
              ] else ...[
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField("Full Name", nameController),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTextField(
                        "Email",
                        emailController,
                        type: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        "Phone",
                        phoneController,
                        type: TextInputType.phone,
                      ),
                    ),

                    SizedBox(width: 20),
                    Expanded(
                      child: _buildTextField("Subject", subjectController),
                    ),
                  ],
                ),
              ],

              SizedBox(height: 20),
              buildMessageBox(),
              SizedBox(height: 40),

              // ---------- Send Button ----------
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: _submitForm,

                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      "SEND MESSAGE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Custom TextField ----------
  Widget _buildTextField(
    String hint,

    TextEditingController controller, {
    TextInputType type = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.4),
            blurRadius: 40,
            spreadRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        keyboardType: type,
        style: GoogleFonts.poppins(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          labelText: hint,
          labelStyle: GoogleFonts.poppins(color: Colors.black),
          hintStyle: GoogleFonts.poppins(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ---------- Message Box ----------
  Widget buildMessageBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurpleAccent.withOpacity(0.4),
            blurRadius: 40,
            spreadRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        controller: messageController,
        maxLines: 6,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: "Message",
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isPasswordVisible = false;

  bool _isHovered = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login-background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/saas-logo.png',
                            height: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                          color: Color(0xFF4F46E5),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'User Name',
                        style: Get.theme.textTheme.labelMedium?.copyWith(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(hint: 'Enter username'),
                      const SizedBox(height: 20),
                      Text(
                        'Password',
                        style: Get.theme.textTheme.labelMedium?.copyWith(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildPasswordField(),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',

                            style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: Color(0xFF94A3B8),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB3B0FF),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: Get.theme.textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: 'Any support required? ',
                                style: Get.theme.textTheme.bodySmall?.copyWith(
                                  color: Color(0xFF475569),
                                ),
                              ),
                              TextSpan(
                                text: 'Reach out to us',
                                style:  Get.theme.textTheme.bodySmall?.copyWith(
                                  color: Color(0xFF475569),
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle tap
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hint}) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: TextField(
        cursorColor: Color(0xFF0F172A),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
            color: const Color(0xFF94A3B8),
          ),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: _isHovered
                  ? const Color(0xFF6C63FF) // hover color
                  : Colors.grey.shade300,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF6C63FF)),
          ),
        ),
      ),
    );

  }

  Widget _buildPasswordField() {
    return MouseRegion(
      child: TextField(
        obscureText: !_isPasswordVisible,
        cursorColor: Color(0xFF0F172A),
        decoration: InputDecoration(
          hintText: 'Enter Password',
          hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
            color: Color(0xFF94A3B8),
          ),
          filled: true,
          fillColor: Colors.white,
          // contentPadding: const EdgeInsets.symmetric(
          //   horizontal: 20,
          //   vertical: 14,
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF6C63FF)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            icon: Image.asset(
              _isPasswordVisible
                  ? 'assets/icons/eye-open.png'
                  : 'assets/icons/eye-close.png',
              width: 22,
              height: 22,
              color:
                  Colors.grey, // works only if PNG is monochrome / supports tint
            ),
          ),
        ),
      ),
    );
  }
}

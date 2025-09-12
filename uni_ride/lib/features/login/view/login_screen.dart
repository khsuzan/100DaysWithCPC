
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar Simulation
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) =>
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == 2 ? Colors.black : Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header Section
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // App Icon
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Center(
                              child: Icon(Icons.directions_bus, color: Colors.white, size: 48),
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Title & Subtitle
                          const Text(
                            'Campus Transit',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const SizedBox(height: 12),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Track your campus buses in real-time and never miss a ride',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Login Form
                    Column(
                      children: [
                        // Email
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            filled: true,
                            fillColor: Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 16),
                        // Password
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextField(
                              controller: passwordController,
                              obscureText: !showPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.grey[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey[200]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey[200]!),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                            IconButton(
                              icon: Icon(
                                showPassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed('/dashboard');
                            },
                            child: const Text('Sign In', style: TextStyle(fontSize: 18, color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Divider with 'or'
                        Row(
                          children: const [
                            Expanded(child: Divider(color: Colors.grey)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('or', style: TextStyle(color: Colors.grey)),
                            ),
                            Expanded(child: Divider(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFD1D5DB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: const Text('Create Account', style: TextStyle(fontSize: 18, color: Colors.black)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Forgot Password
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot your password?', style: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

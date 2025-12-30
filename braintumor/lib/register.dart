import 'package:braintumor/login.dart';
import 'package:braintumor/regAPI.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Branding
                  Column(
                    children: const [
                      Icon(
                        Icons.psychology_alt_rounded,
                        size: 70,
                        color: Colors.white,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'NeuroCare',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Patient Registration',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Glass Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _field(
                          hint: 'Full Name',
                          icon: Icons.person_outline,
                          controller: name
                        ),
                        const SizedBox(height: 18),
                        _field(
                          hint: 'Age',
                          icon: Icons.cake_outlined,
                          keyboard: TextInputType.number,
                          controller: age
                        ),
                        const SizedBox(height: 18),
                        _field(
                          hint: 'Gender',
                          icon: Icons.wc_outlined,
                          controller: gender
                        ),
                        const SizedBox(height: 18),
                        _field(
                          hint: 'Phone Number',
                          icon: Icons.phone_outlined,
                          keyboard: TextInputType.phone,
                          controller: phone
                        ),
                        const SizedBox(height: 18),
                        _field(
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          obscure: true,
                          controller: password
                        ),
                        const SizedBox(height: 30),

                                                const SizedBox(height: 18),
                        _field(
                          hint: 'email',
                          icon: Icons.email,
                          keyboard: TextInputType.emailAddress,
                          controller: email
                        ),
                        const SizedBox(height: 30),

                        // Register Button
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              registerUser(name: name.text, phone: phone.text, age: age.text, gender: gender.text, password: password.text, email: email.text, context: context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00E5FF),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Have an account? Sign in Now',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Footer
                  const Text(
                    'Secure patient data • Hospital grade system',
                    style: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field({
    required String hint,
    required IconData icon,
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
    TextEditingController? controller,
  }) {
    return TextFormField(
      obscureText: obscure,
      keyboardType: keyboard,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white60),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.08),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_flutter_beginner/entities/user.dart';
import 'package:submission_flutter_beginner/shared/routes.dart';
import 'package:submission_flutter_beginner/widgets/my_textfield.dart';

import '../widgets/my_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  bool isVisible = false;

  @override
  void initState() {
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailAddressController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  void navigateToHomeScreen(){
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailAddressController.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Email not valid',
            style: GoogleFonts.getFont('Lato',color: Colors.white),
          ),
        ),
      );
      return;
    }
    if (emailAddressController.text.isEmpty || fullNameController.text.isEmpty || passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please complete form above',
            style: GoogleFonts.getFont('Lato',color: Colors.white),
          ),
        ),
      );
      return;
    }
    Navigator.pushReplacementNamed(
        context, Routes.main,
        arguments: User(
            email: emailAddressController.text,
            fullName: fullNameController.text,
            password: passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('lib/assets/bg_full_circle.png'),
                Positioned(
                  top: 50,
                  left: 30,
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/ic_logo_white.png',
                        color: Colors.white,
                        width: 70,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.getFont('Lato',
                            color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: GoogleFonts.getFont('Lato',
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    label: 'Email Address',
                    controller: emailAddressController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    label: 'Full Name',
                    controller: fullNameController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    label: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: MyButton(
                        buttonTitle: 'Sign In',
                        color: Colors.blueAccent,
                        onPressed: () => navigateToHomeScreen(),
                        colorTitle: Colors.white,
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

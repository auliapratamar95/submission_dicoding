import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_flutter_beginner/shared/routes.dart';
import 'package:submission_flutter_beginner/widgets/my_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'lib/assets/bg_half_circle.png',
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
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
          Align(
            alignment: Alignment.center,
            child: MyButton(
                buttonTitle: 'Sign In',
                color: Colors.purpleAccent,
                onPressed: () => Navigator.pushNamed(context, Routes.login),
                colorTitle: Colors.white),
          ),
        ],
      ),
    );
  }
}

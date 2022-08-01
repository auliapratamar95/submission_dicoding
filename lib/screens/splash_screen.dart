import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_flutter_beginner/shared/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    initial();
    super.initState();
  }

  Timer initial() => Timer(const Duration(seconds: 3), navigateToAuthScreen);

  void navigateToAuthScreen(){
    Navigator.pushNamed(context, Routes.auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Text('Dicoding Submission',
        textAlign: TextAlign.center,
        style: GoogleFonts.getFont('Lato'),),
      body: Center(
        child: Image.asset('lib/assets/ic_logo.png',width: 150,),
      ),
    );
  }
}

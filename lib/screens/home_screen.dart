import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../entities/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'lib/assets/bg_rectangle.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: 100,
                  left: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning',
                        style: GoogleFonts.getFont('Lato', color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            user.email,
                            style: GoogleFonts.getFont('Lato', color: Colors.white),
                          ),
                          const SizedBox(width: 20,),
                          Text(
                            user.fullName,
                            style: GoogleFonts.getFont('Lato', color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

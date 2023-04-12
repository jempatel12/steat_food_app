import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            height: 300,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash_image.png")),
            ),
          ),
          Text(
            "Fast delivery at\n your doorstep",
            style: GoogleFonts.assistant(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            "Home delivery and online reservation\n           system for restaurant & cafe ",
            style: GoogleFonts.assistant(fontSize: 16, color: Colors.white),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Lets Explore",
                  style: GoogleFonts.actor(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

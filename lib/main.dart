import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steat_food_app/provaider/cart_provaider.dart';
import 'package:steat_food_app/views/screens/cart_page.dart';
import 'package:steat_food_app/views/screens/deteil_page.dart';
import 'package:steat_food_app/views/screens/home_page.dart';
import 'package:steat_food_app/views/screens/splesh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      builder: (_, context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "Splash_Screen",
          routes: {
            "/": (context) => HomePage(),
            "Splash_Screen": (context) => Splash_Screen(),
            "CartPage": (context) => CartPage(),
            "DetailPage": (context) => DetailPage(),
          },
        );
      },
    ),
  );
}
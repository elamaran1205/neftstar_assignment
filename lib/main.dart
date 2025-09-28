import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_block.dart';
import 'package:intern_foodapp_assignment/pages/cart_page.dart';
import 'package:intern_foodapp_assignment/pages/home_page.dart';
import 'package:intern_foodapp_assignment/pages/hotel_detail.dart';
import 'package:intern_foodapp_assignment/screen/splash_screen.dart';

void main() {
  // 1️⃣ Register globally with GetX
  Get.put(CartBloc());

  // 2️⃣ Wrap app with BlocProvider for context access
  runApp(
    BlocProvider(
      create: (_) => Get.find<CartBloc>(), // use the same instance
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/detail", page: () => const HotelDetail()),
        GetPage(name: "/cart", page: () => const CartPage()),
      ],
      theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme()),
    );
  }
}

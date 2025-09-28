import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_foodapp_assignment/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg1,
      body: Center(
        child: CircularProgressIndicator(
          color: MyColors.accent,
          strokeWidth: 3,
        ),
      ),
    );
  }
}

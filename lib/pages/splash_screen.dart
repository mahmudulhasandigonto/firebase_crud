import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trytolearn/main.dart';

import 'first_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3))..forward();
    animation = CurvedAnimation(parent: animationController, curve: Curves.linear);

    Timer(
      Duration(seconds: 5),
      () {
        Get.to(()=>FirstPage());
      },
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),

      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset("assets/images/bridge.png"),
        ),
      ),
    );
  }
}

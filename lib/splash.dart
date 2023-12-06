import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gokul/homepage.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return const SplashView();
  }

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/splash.jpeg")
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
    });
  }
}
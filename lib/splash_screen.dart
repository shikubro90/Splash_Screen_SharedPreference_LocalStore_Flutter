import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/home_screen.dart';
import 'package:splashscreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  // Splash Screen timer
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      isLogin();
    });
  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool status = sp.getBool('status')?? false;

    if(status){
      Navigator.push(
          context as BuildContext, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }else{
      Navigator.push(
          context as BuildContext, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1686216941182-0f5699f4584d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=725&q=80'),
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }




}

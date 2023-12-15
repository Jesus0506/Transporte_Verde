import 'dart:async';
//import 'package:aplication_1/screens/login/acceder_registrar.dart';
import 'package:flutter/material.dart';
import 'package:transporte_verde/screens/login/acceder_registrar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () {
        Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_)=> const AccReg()));
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 211, 204, 204), Color.fromARGB(255, 211, 204, 204)]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.jpg',
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            ],
          )
        ),
      ),
    );
  }

}
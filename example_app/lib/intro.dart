import 'package:example_app/Onboarding_Page/onboarding_page.dart';
import 'package:example_app/welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  void initState(){
    super.initState();
    checkOnboarding();
  }

  //Phần intro xuất hiện đầu sau 2s chuyển giao diện Onboarding
  void checkOnboarding() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
    Future.delayed(const Duration(seconds: 2));
    if(!mounted) return;
    if(onboardingCompleted){
      Navigator.pushReplacement(
          context,
         MaterialPageRoute(builder: (context)=> const Welcome())
      );
    } else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0XFF121212),
      body: SafeArea(
          child: Center(
            child: Column(
             mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/intro_icon.png",
                  width: 95,
                  height: 80,
                  fit: BoxFit.contain
                ),
                Container(
                  margin: const EdgeInsets.only(top: 19),
                  child: const Text(
                    'Uptodo',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

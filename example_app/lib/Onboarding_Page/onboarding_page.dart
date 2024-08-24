import 'package:example_app/Onboarding_Page/onboarding_position.dart';
import 'package:example_app/welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:example_app/Onboarding_Page/onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final _pageController = PageController();

  //Nếu tài khoản đã vào app thì lần tới vào thẳng phần welcome
  void _completeonboarding() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=> Welcome())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: PageView(
          controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
          children: [
            OnboardingWidget(
                obdPosition: Onboarding_Position.page1,
                nextOn_Call:(){
                  _pageController.jumpToPage(1) ;
                },
                back_Call: (){},
                skip_Call: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                }
            ),
            OnboardingWidget(
                obdPosition: Onboarding_Position.page2,
                nextOn_Call:(){
                  _pageController.jumpToPage(2) ;
                },
                back_Call: (){
                  _pageController.jumpToPage(0);
                },
                skip_Call: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                }
            ),
            OnboardingWidget(
                obdPosition: Onboarding_Position.page3,
                nextOn_Call:(){
                  _completeonboarding() ;
                },
                back_Call: (){
                  _pageController.jumpToPage(1);
                },
                skip_Call: (){
                  _completeonboarding();
                }
            ),
          ],
        ),
      ),
    );
  }
}

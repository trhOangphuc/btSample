import 'package:example_app/Login/login_page.dart';
import 'package:example_app/Onboarding_Page/onboarding_page.dart';
import 'package:example_app/Register/Register_Page.dart';
import 'package:flutter/material.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void initState(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        leading: IconButton(
          icon: Image.asset(
            color: Colors.white,
            'assets/icon_back.png',
            width: 24,
            height: 24,
          ),
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingPage()),
            );
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Welcome to UpTodo',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please login to your account or create new account to continue',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Lato',
                    color: Colors.white38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 270),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10)
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize:16,
                        fontFamily: 'Lato',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10)
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                        fontSize:16,
                        fontFamily: 'Lato',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

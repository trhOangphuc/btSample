import 'package:example_app/Login/login_page.dart';
import 'package:example_app/models/data/user.dart';
import 'package:example_app/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

import '../models/data/DatabaseHelper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _passwordError;

  Future<void> _register() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      setState(() {
        _passwordError = 'Passwords do not match';
      });
      print("Passwords do not match");
      return;
    }

    final dbHelper = DatabaseHelper();
    final existingUser = await dbHelper.getUserByUsername(username);

    if (existingUser != null) {
      setState(() {
        _passwordError = 'Username already exists';
      });
      print("Username already exists");
      return;
    }

    final newUser = User(username: username, password: password);

    try {
      await dbHelper.insertUser(newUser);
      print("User registered successfully");
    } catch (e) {
      print("Error inserting user: $e");
    }

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> LoginPage())
    );
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
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Welcome()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              'Register',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 10),
          // Phần username và password
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white70
                  ),
                ),
                SizedBox(height: 8),
                // Phần username
                SizedBox(
                  width: 300,
                  height: 42,
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      hintText: 'Enter your Username',
                      hintStyle: TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white70
                  ),
                ),
                SizedBox(height: 8),
                // Phần password
                SizedBox(
                  width: 300,
                  height: 42,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                // Phần Confirm Password
                SizedBox(height: 15),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white70
                  ),
                ),
                SizedBox(height: 8),
                  SizedBox(
                    width: 300,
                    height: 42,
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white38,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                            width: 2.0,
                          ),
                        ),
                        errorText: _passwordError,
                        contentPadding: EdgeInsets.only(bottom: 16.0),//Khoảng trống cho thông báo không làm TF biến danng
                      ),
                      onTap: (){
                        setState(() {
                          _passwordError = null; // xóa thông báo lỗi ở TF về trạng thái ban đầu
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 14),
          // Phần button Register
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: _register, // Sử lý sự kiện button Register
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Phần Line OR
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xFF979797),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "or",
                    style: TextStyle(color: Color(0xFF979797)),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xFF979797),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Phần Button Login With Google
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.deepPurple,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: () {
                // Xử lý sự kiện Login with Google
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/google.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 9),
                  Text(
                    'Login with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // Phần Button Login With Apple
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.deepPurple,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: () {
                // Xử lý sự kiện Login with Apple
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/apple.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 9),
                  Text(
                    'Login with Apple',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Phần Don't have an account
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context)=> LoginPage())
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Already have an account?",
                      ),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

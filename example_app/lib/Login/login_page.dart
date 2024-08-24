import 'package:example_app/Listview/list_page.dart';
import 'package:example_app/Register/Register_Page.dart';
import 'package:example_app/welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:example_app/models/data/DatabaseHelper.dart';

import '../models/data/DatabaseHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isUsernameError = false;
  bool _isPasswordError = false;

  void initState() {
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
              'Login',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 30),
          //phần username và password
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
                //Phần username
                SizedBox(
                  width: 300,
                  height: 42,
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38, //Màu viên
                      hintText: 'Enter your Username',
                      hintStyle: TextStyle(
                          color: Colors.black38
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isUsernameError ? Colors.red : Colors.white,  //Màu viền khi được forcus
                            width: 1.0,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _isUsernameError ? Colors.red : Colors.greenAccent, // Màu viền khi TextField đang được focus
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white70
                  ),
                ),
                SizedBox(height: 8),
                //Phần password
                SizedBox(
                  width: 300,
                  height: 42,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,//Màu viên
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.black38
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isPasswordError ? Colors.red : Colors.white, //Màu viền khi được forcus
                            width: 2.0,
                          )
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _isPasswordError ? Colors.red : Colors.greenAccent, // Màu viền khi TextField đang được focus
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          //Phần buttonLogin
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10)
              ),
              onPressed: () async {
                final username = _usernameController.text;
                final password = _passwordController.text;

                final dbHelper = DatabaseHelper();
                final user = await dbHelper.getUserByUsername(username);

                if (user == null || user.password != password) {
                  setState(() {
                    _isUsernameError = user == null;
                    _isPasswordError = user != null && user.password != password;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Wrong username or password')),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(), // Đảm bảo ListPage được định nghĩa.
                    ),
                  );
                }
              }, //Sử lý sự kiện button Login
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
          SizedBox(height: 10),
          //Phần Line OR
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
                  child: Text("or", style: TextStyle(color: Color(0xFF979797)),),
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
          SizedBox(height: 30),
          //Phần Buttom Login With Google
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
                    padding: EdgeInsets.symmetric(horizontal: 10)
                ),
                onPressed: (){  },//sử lý sự kiện Login with Google
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png',
                      width: 20, // Chiều rộng của icon
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 9,),
                    Text(
                      'Login with Google',
                      style: TextStyle(
                        fontSize:16,
                        fontFamily: 'Lato',
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis, // Đảm bảo text không bị tràn
                    ),
                  ],
                ),
              )
          ),
          //Phần Button Login With Apple
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
                    padding: EdgeInsets.symmetric(horizontal: 10)
                ),
                onPressed: (){  },//sử lý sự kiện Login with Apple
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/apple.png',
                      width: 20, // Chiều rộng của icon
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 9,),
                    Text(
                      'Login with Apple',
                      style: TextStyle(
                        fontSize:16,
                        fontFamily: 'Lato',
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis, // Đảm bảo text không bị tràn
                    ),
                  ],
                ),
              )
          ),
          SizedBox(height: 50,),
          //Phần Don't have an account
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 35),
            child: Center(
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context)=> RegisterPage())
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white, // Màu chữ mặc định
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Don’t have an account? ", // Phần văn bản bình thường
                      ),
                      TextSpan(
                        text: "Register", // Phần văn bản in đậm
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // In đậm
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


import 'package:flutter/material.dart';
import 'package:realme/home.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _obscureText = true;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 36,
            child: Container(
              width: 332,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(245, 251, 251, 1),
              ),
              child: Center(
                child: Image.asset('assets/images/loginmed.png'),
              ),
            ),
          ),
          // Login Container
          Positioned.fill(
            top: 231,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 369,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(1, 1),
                        blurRadius: 4,
                      ),
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'ㅤLoginㅤ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 28,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Positioned(
                                bottom: -8,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 11,
                                  width: 200,
                                  color: Color(0xFF05D5CD),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 18),

                      // Aligned Text Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0), // Adjust left padding here
                              child: Text(
                                'Welcome Back',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 28,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0), // Adjust left padding here
                              child: Text(
                                'Fill out the information below in order to \n access your account.',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(87, 99, 108, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            // Email and Password Fields
                            Column(
                              children: [
                                TextField(
                                  focusNode: _emailFocusNode,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey[400]!,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: _emailFocusNode.hasFocus ? Color(0xFF05D5CD) : Colors.grey[400]!,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    TextField(
                                      focusNode: _passwordFocusNode,
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey[400]!,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _passwordFocusNode.hasFocus ? Color(0xFF05D5CD) : Colors.grey[400]!,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: Icon(
                                          _obscureText ? Icons.visibility_off : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // Login Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                Text(
                                  'Or sign in with',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(88, 100, 109, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center( // Center the buttons and text
                                  child: Column(
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          side: BorderSide(
                                            color: Color.fromRGBO(224, 236, 236, 1),
                                            width: 2,
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 43, vertical: 16),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset('assets/images/Google - Original.png', width: 26, height: 27),
                                            SizedBox(width: 10),
                                            Text(
                                              'Continue With Google',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Color.fromRGBO(16, 21, 24, 1),
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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





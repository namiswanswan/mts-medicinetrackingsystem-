import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:realme/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  bool _isGoogleSignIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isGoogleSignIn = true;
    });
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null && user.providerData.any((info) => info.providerId == 'google.com')) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      }
    } catch(error) {
      print('Error signing in with Google: $error');
    } finally {
      setState(() {
        _isGoogleSignIn = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 251, 251, 1),
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
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
                color: Color.fromRGBO(245, 251, 251, 1),
              ),
              child: Center(
                child: Image.asset('assets/images/loginmed.png'),
              ),
            ),
          ),
          Positioned(
            top: 239,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(1, 0),
                      blurRadius: 10,
                    ),
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3, color: Color(0xFF05D5CD)),
                      ),
                      labelColor: Color.fromRGBO(0, 0, 0, 1),
                      unselectedLabelColor: Colors.white,
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
                      tabs: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Tab(
                            text: 'Login',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 475,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Welcome Back',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 28,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Fill out the information below in order to \n access your account.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(87, 99, 108, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 20),
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
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Icon(
                                          _obscureText ? Icons.visibility_off : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
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
                                ),
                                SizedBox(height: 14),
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
                                    SizedBox(height: 9),
                                    Center(
                                      child: Column(
                                        children: [
                                          OutlinedButton(
                                            onPressed: _signInWithGoogle,
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              side: BorderSide(
                                                color: Color.fromRGBO(224, 236, 236, 1),
                                                width: 2,
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                                          SizedBox(height: 0),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




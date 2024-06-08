import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'home.dart';
import 'widgets.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        icons: [
          Icon(Icons.home),
          Icon(Icons.settings),
          Icon(Icons.notifications),
          Icon(Icons.person),
        ],
        onTapFunctions: [
              () => print('Home icon tapped'),
              () => print('Settings icon tapped'),
              () => print('Notifications icon tapped'),
              () => print('Profile icon tapped'),
        ],
      ),
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInputField(
                hintText: 'First Name',
                icon: Icons.person,
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              CustomInputField(
                hintText: 'Last Name',
                icon: Icons.person,
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Modal(
                        title: 'Login Dialog',
                        message: 'Login action triggered',
                        buttonText: 'OK',
                        onTap: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        icon: Icon(Icons.login), // Add your desired icon
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              CustomLink(
                text: 'Skip',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              SizedBox(height: 20),
              SocialButton(
                buttonText: "Google",
                icon: Image.asset('assets/images/Google - Original.png'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late String _errorMessage;

  @override
  void initState() {
    super.initState();
    _errorMessage = '';
  }

  Future<void> _login() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    final settings = ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'user',
      password: '1',
      db: 'if0_36371201_test',
      timeout: Duration(hours: 1),
    );

    final MySqlConnection conn = await MySqlConnection.connect(settings).timeout(Duration(seconds: 10));
    try {
      final results = await conn.query(
        'SELECT * FROM users WHERE email = ? AND password = ?',
        [username, password],
      );
      print(results);
      if (results.isNotEmpty) {
        // Navigate to home screen or do something on successful login
        print('Login successful');
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    } catch (e) {
      print('Error during login: $e');
      setState(() {
        _errorMessage = 'An error occurred, please try again later';
      });
    } finally {
      await conn.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

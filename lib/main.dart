import 'package:flutter/material.dart';
import 'package:realme/home.dart';
import 'package:realme/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: Home(),
      home:Example(),
      debugShowCheckedModeBanner: false, // Set debug banner to false
    );
  }
}
class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Widgets to Be used')),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomButton(
                  text: 'Next',
                ),
                CustomLink(text: 'Skip',onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },),
                CustomIndicator(totalCount: 3, activeIndex: 1,),
                SizedBox(height: 20),
                CustomInputField(
                  hintText: 'Your Name',
                  icon: Icons.person,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                SocialButton(buttonText: "Google", icon: Image.asset('assets/images/Google - Original.png'),onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },)
              ],
            ),
          )
        ),
      ),
    );
  }
}

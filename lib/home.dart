import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:realme/login.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
          title: Text(
            'Welcome, User',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/Avatar.png'), // Replace with actual avatar image
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(174, 239, 237, 1),
                border: Border.all(
                  color: Color.fromRGBO(5, 213, 205, 1),
                  width: 3,
                ),
              ),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Container(
                    width: 184,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(224, 236, 236, 1),
                      border: Border.all(
                        color: Color.fromRGBO(202, 229, 229, 1),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Medicines',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 184,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(224, 236, 236, 1),
                      border: Border.all(
                        color: Color.fromRGBO(202, 229, 229, 1),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Consultation',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MedicinesTab(),
            ConsultationTab(),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white, // Rounded fill color
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.black, size: 32),
                // Unfilled home icon
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()), // Navigate to Home screen
                  );
                },
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFF87EAE6), // Transparent background for the plus icon
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.black, size: 32),
                  onPressed: () {
                    // Add functionality for plus icon
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 32), // Unfilled search icon
                onPressed: () {
                  // Add functionality for search icon
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicinesTab extends StatefulWidget {
  @override
  _MedicinesTabState createState() => _MedicinesTabState();
}
class _MedicinesTabState extends State<MedicinesTab> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          TableCalendar(
            firstDay: DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyle(color: Colors.grey),
              todayDecoration: BoxDecoration(
                color: Color(0xFF06D5CD), // Today's date color
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false, // Remove month button
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: 393,
            height: 852,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 190,
                  left: 14,
                  child: buildFlipCard(
                    front: buildCardContent(
                      imageAsset: 'assets/images/green.JPG',
                      title: 'Paracetamol',
                      subtitle1: 'Capsule, 500mg',
                      subtitle2: 'Daily, every 4 to 6 hours',
                    ),
                    back: buildBackContentForParacetamol(),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 14,
                  child: buildFlipCard(
                    front: buildCardContent(
                      imageAsset: 'assets/images/blue.JPG',
                      title: 'Fluoxetine',
                      subtitle1: 'Capsule, 20mg',
                      subtitle2: 'Daily, 2 times a day',
                    ),
                    back: buildBackContentForFluoxetine(),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 28,
                  child: Text(
                    'Today’s Medicine',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildFlipCard({required Widget front, required Widget back}) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: front,
      back: back,
    );
  }
  Widget buildCardContent({required String imageAsset, required String title, required String subtitle1, required String subtitle2}) {
    return Container(
      width: 365,
      height: 97,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(1, 1), blurRadius: 4)],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 7,
            left: 16,
            child: Container(
              width: 93,
              height: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: 7,
            left: 138,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 138,
            child: Text(
              subtitle1,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 63,
            left: 138,
            child: Text(
              subtitle2,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildBackContentForParacetamol() {
    return Container(
      width: 365,
      height: 97,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 365,
              height: 97,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(1, 1),
                    blurRadius: 4,
                  ),
                ],
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          Positioned(
            top: 9,
            left: 47,
            child: Text(
              'This Week’s Progress',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 26,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 51,
            left: 6,
            child: Container(
              width: 295,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(2, 202, 148, 0.8),
              ),
            ),
          ),
          Positioned(
            top: 53,
            left: 177,
            child: Text(
              '80%',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 26,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackContentForFluoxetine() {
    return Container(
      width: 365,
      height: 97,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 365,
              height: 97,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(1, 1),
                    blurRadius: 4,
                  ),
                ],
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          Positioned(
            top: 9,
            left: 47,
            child: Text(
              'This Week’s Progress',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 26,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 51,
            left: 6,
            child: Container(
              width: 192,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(173, 235, 248, 1),
              ),
            ),
          ),
          Positioned(
            top: 54,
            left: 177,
            child: Text(
              '50%',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 26,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 10,
            child: Container(
              width: 374,
              height: 94,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 82,
            child: Text(
              'pageview here',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 21,
            child: Text(
              'Doctors Near Me',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 19,
            child: Container(
              width: 355.1147766113281,
              height: 105,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 355,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          )
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 355,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(214, 249, 248, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 77,
                    child: Text(
                      'Dr. Emily Carter',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 77,
                    child: Text(
                      'Neurologist',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(27, 34, 37, 1),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 2,
                    child: Container(
                      width: 61,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('assets/images/doc1.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.11381307989358902,
                    left: 355.1147766113281,
                    child: Transform.rotate(
                      angle: -90.11856388489437 * (math.pi / 180),
                      child: Container(
                        width: 55.51963424682617,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/images/dots.png'),//here
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 62.99995803833008,
                    left: 13,
                    child: Container(
                      width: 105,
                      height: 33,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 105,
                              height: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(170, 205, 203, 0.7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 3,
                            left: 4,
                            child: Text(
                              '⏱︎ 14 years',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 62.99995803833008,
                    left: 128,
                    child: Container(
                      width: 64,
                      height: 33,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 64,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(170, 205, 203, 0.7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            left: 7,
                            child: Text(
                              '↑ 90% ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 61,
                    left: 201,
                    child: GestureDetector(
                      onTap: () {
                        // Handle appointment button tap
                      },
                      child: Container(
                        width: 146,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(170, 205, 203, 0.7),
                        ),
                        child: Center(
                          child: Text(
                            '+ Appointment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 310,
            left: 21,
            child: Container(
              width: 355.1147766113281,
              height: 105,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 355,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          )
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 355,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(214, 249, 248, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 77,
                    child: Text(
                      'Dr. James Benedict',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32,
                    left: 77,
                    child: Text(
                      'Pediatrician',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(27, 34, 37, 1),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 2,
                    child: Container(
                      width: 61,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('assets/images/doc2.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.11381307989358902,
                    left: 355.1147766113281,
                    child: Transform.rotate(
                      angle: -90.11856388489437 * (math.pi / 180),//here
                      child: Container(
                        width: 55.51963424682617,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/images/dots.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 64,
                    left: 13,
                    child: Container(
                      width: 105,
                      height: 33,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 105,
                              height: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(170, 205, 203, 0.7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 6,
                            left: 4,
                            child: Text(
                              '⏱︎ 18 years',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 64,
                    left: 128,
                    child: Container(
                      width: 64,
                      height: 34,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 64,
                              height: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(170, 205, 203, 0.7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 6,
                            left: 7,
                            child: Text(
                              '↑ 95% ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 62.99995803833008,
                    left: 201,
                    child: GestureDetector(
                      onTap: () {
                        // Handle appointment button tap
                      },
                      child: Container(
                        width: 146,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(170, 205, 203, 0.7),
                        ),
                        child: Center(
                          child: Text(
                            '+ Appointment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //doc3
          Positioned(
            top: 430,
            left: 19,
            child: Container(
              width: 355.1147766113281,
              height: 105,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 355,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          )
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 355,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(214, 249, 248, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 77,
                    child: Text(
                      'Dr. Emily Carter',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 77,
                    child: Text(
                      'Neurologist',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(27, 34, 37, 1),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 2,
                    child: Container(
                      width: 61,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('assets/images/doc1.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.11381307989358902,
                    left: 355.1147766113281,
                    child: Transform.rotate(
                      angle: -90.11856388489437 * (math.pi / 180),
                      child: Container(
                        width: 55.51963424682617,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/images/dots.png'),//here
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 62.99995803833008,
                    left: 13,
                    child: Container(
                      width: 105,
                      height: 33,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 105,
                              height: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(170, 205, 203, 0.7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 3,
                            left: 4,
                            child: Text(
                              '⏱︎ 14 years',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 62.99995803833008,
                    left: 128,
                    child: Container(
                      width: 64,
                      height: 33,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 64,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(170, 205, 203, 0.7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            left: 7,
                            child: Text(
                              '↑ 90% ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 61,
                    left: 201,
                    child: GestureDetector(
                      onTap: () {
                        // Handle appointment button tap
                      },
                      child: Container(
                        width: 146,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(170, 205, 203, 0.7),
                        ),
                        child: Center(
                          child: Text(
                            '+ Appointment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

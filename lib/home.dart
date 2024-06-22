import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:realme/login.dart';
import 'package:table_calendar/table_calendar.dart';

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
            'Welcome, Sana',
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
            top: 55,
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
            top: 45,
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
            top: 48,
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
    return Center(
      child: Text(
        'Consultation Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

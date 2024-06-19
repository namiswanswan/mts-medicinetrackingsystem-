import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;
import 'package:flip_card/flip_card.dart';

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
    late TabController tabController;
    bool isFluoxetineTaken = false;
    bool isParacetamolTaken = false;
    late PageController _pageController;

    @override
    void initState() {
        super.initState();
        tabController = TabController(length: 2, vsync: this);
        _pageController = PageController(initialPage: 0);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                            children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/Avatar.png'),
                                ),
                                SizedBox(width: 8),
                                Text(
                                    'Olivia',
                                    style: TextStyle(fontSize: 18),
                                ),
                            ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications),
                        ),
                    ],
                ),
            ),
            body: Column(
                children: [
                    Container(
                        margin: EdgeInsets.all(4), // Add margin around the entire TabBar
                        child: Padding(
                            padding: EdgeInsets.only(top: 12), // Add padding to the top
                            child: Align(
                                alignment: Alignment(0, 0),
                                child: TabBar(
                                    controller: tabController,
                                    labelPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0), // Right and left padding for the labels
                                    indicatorPadding: EdgeInsets.all(1), // Ensure the indicator covers the entire tab
                                    indicator: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100), // Creates border radius for the indicator
                                            side: BorderSide(color: Color(0xFF06d5cd), width: 2), // Border color and width when selected
                                        ),
                                        color: Color(0x4c06d5cd), // Fill color when selected
                                    ),
                                    labelColor: Colors.black, // Color of the label when selected
                                    unselectedLabelColor: Colors.black, // Color of the label when not selected
                                    labelStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16, // Ensure consistent font size when selected
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16, // Ensure consistent font size when not selected
                                    ),
                                    tabs: [
                                        Tab(
                                            child: Container(
                                                margin: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0), // Margin between tabs
                                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0.5), // Padding inside the tab
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(1000), // Rounded corners
                                                    color: tabController!.index == 0 ? Color(0xffdfedec) : Colors.transparent, // Background color when selected and unselected
                                                    border: Border.all(color: tabController!.index == 0 ? Color(0xFF06d5cd) : Color(0xffe7eae9), width: 2), // Border color based on selection
                                                ),
                                                child: Text(
                                                    'Medicines',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0,
                                                        fontSize: 16,
                                                        color: Colors.black, // Text color remains black
                                                    ),
                                                ),
                                            ),
                                        ),
                                        Tab(
                                            child: Container(
                                                margin: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0), // Margin between tabs
                                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0.5), // Padding inside the tab
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(1000), // Rounded corners
                                                    color: tabController!.index == 1 ? Color(0xffdfedec) : Colors.transparent, // Background color when selected and unselected
                                                    border: Border.all(color: tabController!.index == 1 ? Color(0xFF06d5cd) : Color(0xffe7eae9), width: 2), // Border color based on selection
                                                ),
                                                child: Text(
                                                    'Consultation',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0,
                                                        fontSize: 16,
                                                        color: Colors.black, // Text color remains black
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: TabBarView(
                            controller: tabController,
                            children: [
                                SingleChildScrollView(
                                    child: Column(
                                        children: [
                                            SizedBox(height: 10),
                                            TableCalendar(
                                                firstDay: DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
                                                lastDay: DateTime.now().add(Duration(days: 365)),
                                                focusedDay: DateTime.now(),
                                                calendarFormat: CalendarFormat.week,
                                                onDaySelected: (selectedDay, focusedDay) {
                                                    setState(() {});
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
                                            Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 12),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        Text(
                                                            "Today's Medication",
                                                            style: TextStyle(fontSize: 24),
                                                        ),
                                                        SizedBox(height: 12),
      Padding(
      padding: EdgeInsets.all(16.0),
      child: FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _buildMedicationCard(
      'Fluoxetine',
      'assets/images/Blue.png',
      'Capsule, 20mg',
      'Daily, 2 times a day',
      isFluoxetineTaken,
      ),
      back: _buildProgressCard('50%'),
      ),
      ),
      SizedBox(height: 8), // Add space
      Padding(
      padding: EdgeInsets.all(16.0),
      child: FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _buildMedicationCard(
      'Paracetamol',
      'assets/images/Green.png',
      'Capsule, 500mg',
      'Daily, every 4 to 6 hours',
      isParacetamolTaken,
      ),
      back: _buildProgressCard('80%'),
      ),
      ),
      ],
      ),
      ),
      );
    }
    Widget _buildMedicationCard(String name, String imagePath, String dose, String instruction, bool isTaken) {
      return Container(
        width: 363,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 99,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 6, 0, 5),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 20, letterSpacing: 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                    child: Text(
                      dose,
                      style: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      instruction,
                      style: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: 0),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            if (isTaken)
              Icon(
                Icons.check,
                color: Colors.green,
              ),
          ],
        ),
      );
    }

    Widget _buildProgressCard(String progress) {
      return Container(
        width: 363,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
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
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
        Positioned(
          top: 51,
          left: 6,
          child: Container(
            width: progress == '50%' ? 192 : 295,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: progress == '50%'
                  ? Color.fromRGBO(173, 235, 248, 1)
                  : Color.fromRGBO(2, 202, 148, 0.8),
            ),
          ),
        ),
        Positioned(
          top: 48,
          left: 177,
          child: Text(
            progress,
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
            ],
          ),

                                SingleChildScrollView(
                                    child: Column(
                                        children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        Container(// Carousel of doctor images
                                                            width: double.infinity,
                                                            height: 175,
                                                            child: Stack(
                                                                children: [
                                                                    Padding(
                                                                        padding: EdgeInsets.fromLTRB(8, 12, 8, 40),
                                                                        child: PageView(
                                                                            controller: _pageController,
                                                                            scrollDirection: Axis.horizontal,
                                                                            children: [
                                                                        ClipRRect(
                                                                        borderRadius: BorderRadius.circular(35), // Set the radius as needed
                                                                        child: Image.network(
                                                                                    'https://img.freepik.com/free-photo/doctor-suggesting-hospital-program-patient_53876-14806.jpg?size=626&ext=jpg',
                                                                                    width: 300,
                                                                                    height: 287,
                                                                                    fit: BoxFit.cover,
                                                                                ),
                                                                        ),
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(35), // Set the radius as needed
                                                    child: Image.network(
                                                                                    'https://images.unsplash.com/photo-1638202993928-7267aad84c31?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8ZG9jdG9yfGVufDB8fHx8MTcxNzQwMzcxOHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                                    width: 300,
                                                                                    height: 200,
                                                                                    fit: BoxFit.fitWidth,
                                                                                ),
                                                ),
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(35), // Set the radius as needed
                                                    child: Image.network(
                                                                                    'https://picsum.photos/seed/422/600',
                                                                                    width: 300,
                                                                                    height: 200,
                                                                                    fit: BoxFit.cover,
                                                                                ),
                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                    Align(
                                                                        alignment: AlignmentDirectional(-1, 1),
                                                                        child: Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 16),
                                                                            child: smooth_page_indicator.SmoothPageIndicator(
                                                                                controller: _pageController,
                                                                                count: 3,
                                                                                axisDirection: Axis.horizontal,
                                                                                onDotClicked: (i) async {
                                                                                    await _pageController.animateToPage(
                                                                                        i,
                                                                                        duration: Duration(milliseconds: 500),
                                                                                        curve: Curves.ease,
                                                                                    );
                                                                                    setState(() {});
                                                                                },
                                                                                effect: smooth_page_indicator.ExpandingDotsEffect(
                                                                                    expansionFactor: 3,
                                                                                    spacing: 8,
                                                                                    radius: 16,
                                                                                    dotWidth: 16,
                                                                                    dotHeight: 8,
                                                                                    dotColor: Color(0xFF4C06D5CD), activeDotColor: Colors.black,
                                                                                    paintStyle: PaintingStyle.fill,
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                        // Doctor's Name and Info
                                                        Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 12),
                                                            child: Text(
                                                                'Doctors Near Me',
                                                                style: TextStyle(fontSize: 23, letterSpacing: 0, fontFamily: 'Inter'),
                                                            ),
                                                        ),
                                                        // Doctor's Card
                                                        Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                                                            child: Container(
                                                                width: double.infinity,
                                                                height: 94,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(24),
                                                                ),
                                                                child: Row(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    children: [
                                                                        Container(
                                                                            width: 94,
                                                                            height: 94,
                                                                            decoration: BoxDecoration(
                                                                                color: Color(0x5F91F0EB),
                                                                                borderRadius: BorderRadius.circular(60),
                                                                            ),
                                                                            child: Image.asset(
                                                                                'assets/images/doc1.png',
                                                                                fit: BoxFit.cover,
                                                                            ),
                                                                        ),
                                                                        Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                            child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                    Text(
                                                                                        'Dr. Emily Carter',
                                                                                        style: TextStyle(fontSize: 19, letterSpacing: 0, fontFamily: 'Readex Pro'),
                                                                                    ),
                                                                                    Text(
                                                                                        'Neurologist',
                                                                                        style: TextStyle(fontSize: 15, letterSpacing: 0, fontFamily: 'Poppins'),
                                                                                    ),
                                                                                ],
                                                                            ),
                                                                        ),
                                                                        Spacer(),
                                                                        Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                            child: Icon(
                                                                                Icons.drag_indicator,
                                                                                color: Color(0xFF545454),
                                                                                size: 35,
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                                Flexible(
                                                                    child: Row(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                            Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(11, 5, 10, 0),
                                                                                child: ElevatedButton(
                                                                                    onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                    }, style: ButtonStyle(
                                                                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0x5F91F0EB)),
                                                                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                                                                        RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(60),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                                    child: Text(
                                                                                        '⏱︎ 14 years',
                                                                                        style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF030303),
                                                                                            fontSize: 15,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 5, 10, 0),
                                                                                child: ElevatedButton(
                                                                                    onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                    },
                                                                                    style: ButtonStyle(
                                                                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0x5F91F0EB)),
                                                                                        shape: MaterialStateProperty.all<OutlinedBorder>(
                                                                                            RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(60),
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                    child: Text(
                                                                                        '↑ 90% ',
                                                                                        style: TextStyle(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Colors.black,
                                                                                            fontSize: 15,
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                            Expanded(
                                                                                child: Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 9, 0),
                                                                                        child: ElevatedButton(
                                                                                            onPressed: () async {
                                                                                                Navigator.pushNamed(context, 'doctor1');
                                                                                            },
                                                                                            style: ButtonStyle(
                                                                                                backgroundColor: MaterialStateProperty.all<Color>(Color(0x5F91F0EB)),
                                                                                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                                                                                    RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(60),

                                                                                                            bottomRight: Radius.circular(60),
                                                                                                            topLeft: Radius.circular(60),
                                                                                                            topRight: Radius.circular(60),
                                                                                                        ),
                                                                                                    ),
                                                                                                ),
                                                                                            ),
                                                                                            child: Text(
                                                                                                '+ Appointment',
                                                                                                style: TextStyle(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 15,
                                                                                                ),
                                                                                            ),
                                                                                        )
                                                                                    )
                                                                                )
                                                                            )],
                                                                    ),
                                                                ),
                                                            ]),
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
                ],
            ),
        );
    }
}




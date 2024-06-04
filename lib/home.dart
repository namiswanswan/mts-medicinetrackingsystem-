import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
    late TabController tabController;
    bool isLisinoprilTaken = false;
    bool isMetforminTaken = false;

    @override
    void initState() {
        super.initState();
        tabController = TabController(length: 2, vsync: this);
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
                    TabBar(
                        controller: tabController,
                        tabs: [
                            Tab(text: 'Medicines'),
                            Tab(text: 'Consultation'),
                        ],
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: tabController,
                            children: [
                                SingleChildScrollView(
                                    child: Column(
                                        children: [
                                            SizedBox(height: 12),
                                            TableCalendar(
                                                firstDay: DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
                                                lastDay: DateTime.now().add(Duration(days: 365)),
                                                focusedDay: DateTime.now(),
                                                calendarFormat: CalendarFormat.week,
                                                onDaySelected: (selectedDay, focusedDay) {
                                                    setState(() {});
                                                },
                                                calendarStyle: CalendarStyle(
                                                    weekendTextStyle: TextStyle(color: Colors.blue),
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
                                                        GestureDetector(
                                                            onHorizontalDragEnd: (_) {
                                                                setState(() {
                                                                    isLisinoprilTaken = !isLisinoprilTaken;
                                                                });
                                                            },
                                                            child: Container(
                                                                width: double.infinity,
                                                                height: 100,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    boxShadow: [
                                                                        BoxShadow(
                                                                            color: Colors.grey.withOpacity(0.5),
                                                                            spreadRadius: 2,
                                                                            blurRadius: 5,
                                                                            offset: Offset(0, 3), // changes position of shadow
                                                                        ),
                                                                    ],
                                                                ),
                                                                child: Row(
                                                                    children: [
                                                                        ClipRRect(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            child: Image.asset(
                                                                                'assets/images/Lisinopril.png', // Placeholder for Lisinopril image
                                                                                width: 99,
                                                                                height: 100,
                                                                                fit: BoxFit.cover,
                                                                            ),
                                                                        ),
                                                                        SizedBox(width: 10),
                                                                        Column(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                                Text(
                                                                                    'Lisinopril',
                                                                                    style: TextStyle(fontSize: 20),
                                                                                ),
                                                                                Text(
                                                                                    '1 Pill (10mg)',
                                                                                    style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        color: Colors.black,
                                                                                    ),
                                                                                ),
                                                                                Text(
                                                                                    'Take one tablet every morning.',
                                                                                    style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        color: Colors.black,
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                        Spacer(),
                                                                        if (isLisinoprilTaken)
                                                                            Icon(
                                                                                Icons.check,
                                                                                color: Colors.green,
                                                                            ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                        SizedBox(height: 20), // Add space
                                                        GestureDetector(
                                                            onHorizontalDragEnd: (_) {
                                                                setState(() {
                                                                    isMetforminTaken = !isMetforminTaken;
                                                                });
                                                            },
                                                            child: Container(
                                                                width: double.infinity,
                                                                height: 100,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    boxShadow: [
                                                                        BoxShadow(
                                                                            color: Colors.grey.withOpacity(0.5),
                                                                            spreadRadius: 2,
                                                                            blurRadius: 5,
                                                                            offset: Offset(0, 3), // changes position of shadow
                                                                        ),
                                                                    ],
                                                                ),
                                                                child: Row(
                                                                    children: [
                                                                        ClipRRect(
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            child: Image.asset(
                                                                                'assets/images/Metformin.png', // Placeholder for Metformin image
                                                                                width: 99,
                                                                                height: 100,
                                                                                fit: BoxFit.cover,
                                                                            ),
                                                                        ),
                                                                        SizedBox(width: 10),
                                                                        Column(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                                Text(
                                                                                    'Metformin',
                                                                                    style: TextStyle(fontSize: 20),
                                                                                ),
                                                                                Text(
                                                                                    '1 Pill (500mg)',
                                                                                    style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        color: Colors.black,
                                                                                    ),
                                                                                ),
                                                                                Text(
                                                                                    'Take one tablet after dinner.',
                                                                                    style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        color: Colors.black,
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                        Spacer(),
                                                                        if (isMetforminTaken)
                                                                            Icon(
                                                                                Icons.check,
                                                                                color: Colors.green,
                                                                            ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                                SingleChildScrollView(
                                    child: Column(
                                        children: [
                                            // Add content for the second tab here
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}

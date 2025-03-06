import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      
      body: ListView(
        children: [
          SizedBox(height: 15,),
          Center(child: Text("First page")),
          SizedBox(height: 15,),
          Center(
            child: InkWell(
              child: Text("Buck_ward"),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      
      body:  ListView(
        children: [
          SizedBox(height: 15,),
          Center(child: Text("Second page")),
          SizedBox(height: 15),
          Center(
            child: InkWell(
              child: Text("Buck_ward"),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ), 
    );
  }
}

// messages
class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}
class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messages")),
      
      body:  ListView(
        children: [
          SizedBox(height: 15,),
          Center(child: Text("List of messages")),
          SizedBox(height: 15),
        ],
      ), 
    );
  }
}

// Notification
class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
}
class _NoticesState extends State<Notices> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller =CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notice"),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //initialCalendarFormat: CalendarFormat.week,
              calendarController: _controller,


              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,                
                selectedColor: Theme.of(context).primaryColor,
                selectedStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                // centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white70,
                ),
                //formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toString());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                    
                  );
                  
                },
                todayDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                  );
                }
                
              ),
            )
          ],
        ),
      ),
    ); 
  }
}


// Exams
class Exams extends StatefulWidget {
  @override
  _ExamsState createState() => _ExamsState();
}
class _ExamsState extends State<Exams> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller =CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exam"),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //initialCalendarFormat: CalendarFormat.week,
              calendarController: _controller,


              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,                
                selectedColor: Theme.of(context).primaryColor,
                selectedStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                // centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white70,
                ),
                //formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toString());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                    
                  );
                  
                },
                todayDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                  );
                }
                
              ),
            )
          ],
        ),
      ),
    ); 
  }
}

// Exam result
class ExamResult extends StatefulWidget {
  @override
  _ExamResultState createState() => _ExamResultState();
}
class _ExamResultState extends State<ExamResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exam Result")),
      
      body:  ListView(
        children: [
          SizedBox(height: 15,),
          Center(child: Text("ALL of Exam result")),
          SizedBox(height: 15),
          Center(
            child: InkWell(
              child: Text("Buck_ward"),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ), 
    );
  }
}




// Attendance
class Attendance extends StatefulWidget {

  @override
  _AttendanceState createState() => _AttendanceState();
}
class _AttendanceState extends State<Attendance> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller =CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendence"),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //initialCalendarFormat: CalendarFormat.week,
              calendarController: _controller,


              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,                
                selectedColor: Theme.of(context).primaryColor,
                selectedStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                // centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white70,
                ),
                //formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toString());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                    
                  );
                  
                },
                todayDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                  );
                }
                
              ),
            )
          ],
        ),
      ),
    ); 
  }
}


// Holiday
class Holiday extends StatefulWidget {
  @override
  _HolidayState createState() => _HolidayState();
}
class _HolidayState extends State<Holiday> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller =CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Holiday"),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //initialCalendarFormat: CalendarFormat.week,
              calendarController: _controller,


              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,                
                selectedColor: Theme.of(context).primaryColor,
                selectedStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                // centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white70,
                ),
                //formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toString());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                    
                  );
                  
                },
                todayDayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    ),
                    child: Text(date.day.toString(), style: TextStyle(color: Colors.white),),
                  );
                }
                
              ),
            )
          ],
        ),
      ),
    ); 
  }
}


// class Routine
class Routine extends StatefulWidget {
  @override
  _RoutineState createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Class Time Table")),
      body: Text("TODO: Class Time Table here"),
    );
  }
}

class NoData extends StatefulWidget {
  @override
  _NoDataState createState() => _NoDataState();
}

class _NoDataState extends State<NoData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("no data"),),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Text("No Data \n This app needs to connet witn server"),
            SizedBox(height: 250),

            RaisedButton(
              onPressed: () {
            Navigator.of(context).pop();

              },
              child: Text("Go back"),
            ),
          ],
        )
      ),
    );
  }
}


// // Profile
// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
      
//       body:  ListView(
//         children: [
//           Image(image: AssetImage('assets/profile.png')),
//           Center(
//             child: InkWell(
//               child: Text("Buck_ward"),
//               onTap: (){
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ],
//       ), 
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'profile.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("My School "),
        elevation: 4, // the shado of AppBar  
      ),
      drawer: MenuDrawer(),
   
       
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:20, left: 16, right: 16),
          child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  childAspectRatio: 17/ 27,
                  children: <Widget>[
                    // profile
                    InkWell(
                      onTap: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => Profile()),
                           );
                            costomAlert(context, "no data", "You need to connect with server", "go back");
                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/profile.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Profile"),
                          )
                        ],
                      ),
                    ),
                    // class routine
                    InkWell(
                      onTap: () {
                         Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Routine()),
                          );
                          costomAlert(context, "no Data", "You need to connect with server", "OK");
                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/classroutine.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,),
                            child: Text("Routine"),
                          ),    
                        ],
                      ),
                    ),   
                    // Exam
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Exams()),
                          );
                          costomAlert(context, "no data", "You need to connect with server", "go back");

                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/exam.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Exam"),
                          )
                        ],
                      ),
                    ),
                    // Messages
                    InkWell(
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Messages()),
                          );
                          costomAlert(context, "no data", "You need to connect with server", "go back");
                        },
                        child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/message.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Messages"),
                          )
                        ],
                      ),
                    ),
                    // result
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ExamResult()),
                          );
                          costomAlert(context, "no data", "You need to connect with server", "go back");
                      },
                        child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/result.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Result"),
                          )
                        ],
                      ),
                    ),
                    //Attendence
                    InkWell(
                      onTap: () {
                          // Navigator.of(context).pop();
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Attendance()),
                          );
                          costomAlert(context, "no data", "You need to connect with server", "go back");
                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/attendance.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Atendanc"),
                          )
                        ],
                      ),
                    ),
                    // Notice
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Notices()),
                          );
                          costomAlert(context, "no data", "You need to connect with server", "go back");
                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/notice.png')),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Notice"),
                          )
                        ],
                      ),
                    ),
                    // Holiday
                    InkWell(
                      onTap: () {
                         Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Holiday()),
                          );
                          costomAlert(context, "no data", "You need to connect with server", "go back");
                      },
                      child: Column(
                      children: <Widget>[
                        Image(image: AssetImage('assets/holiday.png')),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Holiday"),
                        )
                  ],
                ),
              ),
            ], 
          ),
        ),
      ),
    );
  }
}

Future<void> costomAlert(BuildContext context,[String text1, String text2, String text3]) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text1),
        content: SingleChildScrollView(
          child: Text(text2),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(text3),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


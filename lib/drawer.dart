import 'package:flutter/material.dart';
import 'pages.dart';
import 'loginpage.dart';
import 'profile.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
 

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
            ),

            accountName: Text("adam serage"),
            accountEmail: Text("adam@serag.com"),
          ),
          
          
          ListTile(
            title: Text("Subject"),
            trailing: Icon(Icons.subject),
            onTap: () {
             
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no HOliday data ", "This app needs to connet witn server", "OK");
            },
          ),

          ListTile(
            title: Text("ClassRoutine"),
            trailing: Icon(Icons.access_time),
            onTap: () {
              
              //Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no Accont data ", "This app needs to connet witn server", "OK");

            },
          ),
          ListTile(
            title: Text("Exam"),
            trailing: Icon(Icons.list),
            onTap: () {
              
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Exams()),
              ); 
              drowerAlert(context, "no Exams data ", "This app needs to connet witn server", "OK");
            },
          ),

          ListTile(
            title: Text("Free Payment"),
            trailing: Icon(Icons.accessibility),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no Payment data ", "This app needs to connet witn server", "OK");
            },
          ),

          ListTile(
            title: Text("Payment"),
            trailing: Icon(Icons.account_balance_wallet),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no Payment data ", "This app needs to connet witn server", "OK");
            },
          ),

          ListTile(
            title: Text("Transport"),
            trailing: Icon(Icons.airport_shuttle),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no Transport data ", "This app needs to connet witn server", "OK");
            },
          ),
          ListTile(
            title: Text("Notifications"),
            trailing: Icon(Icons.notifications),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no Notifycation data ", "This app needs to connet witn server", "OK");
            },
          ),
          ListTile(
            title: Text("Messages"),
            trailing: Icon(Icons.mail),
            onTap: () {
              
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Messages()),
              ); 
              drowerAlert(context, "no Messagees ", "This app needs to connet witn server", "OK");
            },
          ),
          ListTile(
            title: Text("Holiday"),
            trailing: Icon(Icons.local_hotel),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Holiday()),
              ); 
              drowerAlert(context, "no HOliday data ", "This app needs to connet witn server", "OK");
            },
          ),
          ListTile(
            title: Text("Library"),
            trailing: Icon(Icons.local_library),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoData()),
              ); 
              drowerAlert(context, "no Library data ", "This app needs to connet witn server", "OK");
            },
          ),
          ListTile(
            title: Text("Account"),
            trailing: Icon(Icons.perm_contact_calendar),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profile()),
              ); 
              drowerAlert(context, "no Accont data ", "This app needs to connet witn server", "OK");
            },
          ),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ); 
            },
          ),
        ],
      ),
    );
  }
}

Future<void> drowerAlert(BuildContext context,[String text1, String text2, String text3]) async {
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


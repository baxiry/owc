import 'package:flutter/material.dart';

class Therms extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _Therms createState() => _Therms();
}

class _Therms extends State<Therms> {
  @override
  Widget build(BuildContext context) {


final welcome =Padding(
  padding: EdgeInsets.all(8),
  child: Text( 'Therms of use',
    style: TextStyle(fontSize: 28, color: Colors.white),
  ),
);

final lorem = Padding(
  padding: EdgeInsets.all(8),
  child: Text( 'Optimism is the one quality more associated with success and happiness than any and happiness than any other. If the plan doesn’t work, change the plan, but never the goal. I destroy my enemies when I make them my friends',
    style: TextStyle(fontSize: 18, color: Colors.white),
  ),
);
final goback =InkWell(
  child: Text("goback"),
  onTap: () {
    Navigator.of(context).pop();
  },
);

final body = Container(
  
  width: MediaQuery.of(context).size.width,
  padding: EdgeInsets.all(28),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.amber, Colors.amberAccent]
    ),
  ),
  child: Column(
    children: <Widget>[welcome, lorem,SizedBox(height: 20,), goback],
  ),
  );
  return Scaffold(
    body: body,
  );
}
}


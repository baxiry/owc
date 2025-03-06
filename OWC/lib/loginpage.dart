import 'package:flutter/material.dart';
import 'home.dart';
import 'thermspage.dart';
        
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}
            
class _LoginPageState extends State<LoginPage> {
            
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',                          
      child: CircleAvatar(    
        backgroundColor: Colors.transparent,
        radius: 48,
        child: Image.asset('assets/schoolicon.png'),
      ),
    );
 final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green,
        shadowColor: Colors.lightGreenAccent.shade100,
        elevation: 5,
        child: MaterialButton(
          minWidth: 200,
          height: 42,
          onPressed: () {
            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
          },
          child: Text('Log In', style:TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLible =FlatButton(
      child: Text('Forgot password?', style: TextStyle(color: Colors.black54)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
    );

    final register = FlatButton(
      child: Text('Terms of use', style: TextStyle(color: Colors.black54)),
      onPressed: () {        
        Navigator.push(context, MaterialPageRoute(builder: (context) => Therms()));
      },
    );
    return Scaffold(

      //backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
         ),

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24, right: 24),
          children: <Widget>[
            SizedBox(height: 15),
            logo,
            SizedBox(height: 48),
            email,
            SizedBox(height: 8),
            password,
            SizedBox(height: 24),
            loginButton,
            register,
            forgotLible,
           SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}



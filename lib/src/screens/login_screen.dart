import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  Widget build(context) {
    return Form(
      key: formkey,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logoAndTitle(),
            SizedBox(height: 30.0),
            nameAndAge(),
            SizedBox(height: 8.0),
            email(),
            SizedBox(height: 8.0),
            password(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'example@example.com',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(),
        ),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(value)) {
          return 'Invalid Email';
        } else {
          return null;
        }
      },
    );
  }

  Widget name() {
    return Expanded(
        child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter a valid Name';
        } else {
          return null;
        }
      },
    ));
  }

  Widget age() {
    return Expanded(
        child: TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Age',
        contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter a valid age';
        } else {
          return null;
        }
      },
    ));
  }

  Widget password() {
    return Expanded(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'P@ssword?123',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(),
          ),
          prefixIcon: Icon(Icons.lock),
        ),
        validator: (String value) {
          if (value.length < 4) {
            return 'Password must be atleast 4 characters';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget logoAndTitle() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/login.png'),
            height: 60,
            width: 60,
          ),
          SizedBox(width: 80.0),
          Text("Login"),
        ],
      ),
    );
  }

  Widget nameAndAge() {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            name(),
            SizedBox(width: 20),
            age(),
          ]),
    );
  }

  Widget submitButton() {
    return ButtonTheme(
      minWidth: 400,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          formkey.currentState.validate();
        },
        color: Colors.lightBlue,
        child: Text("Submit"),
      ),
    );
  }
}

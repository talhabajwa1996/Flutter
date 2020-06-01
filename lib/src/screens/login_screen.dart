import 'package:flutter/material.dart';
import '../mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidatorMixin {
  var formkey = GlobalKey<FormState>();
  String savedEmail = '';
  String savedPassword = '';

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
            SizedBox(height: 50.0),
            //nameAndAge(),
            //SizedBox(height: 8.0),
            email(),
            SizedBox(height: 8.0),
            password(),
            SizedBox(height: 50),
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
        //labelText: 'Email',
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(),
        ),
        prefixIcon: Icon(Icons.email),
      ),
      validator: validateEmail,
      onSaved: (value) {
        savedEmail = value;
      },
    );
  }

  /*Widget name() {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Name',
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
      ),
    );
  }

  Widget age() {
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Age',
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
      ),
    );
  }*/

  Widget password() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        //labelText: 'Password',
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(),
        ),
        prefixIcon: Icon(Icons.lock),
      ),
      validator: validatePassword,
      onSaved: (value) {
        savedPassword = value;
      },
    );
  }

  Widget logoAndTitle() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/login.png'),
            height: 100,
            width: 100,
          ),
          SizedBox(height: 20.0),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'SourceSansLight',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  /*Widget nameAndAge() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          name(),
          SizedBox(width: 20),
          age(),
        ],
      ),
    );
  }*/

  Widget submitButton() {
    return ButtonTheme(
      minWidth: 400,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          if (formkey.currentState.validate()) {
            formkey.currentState.save();
            print("The Email is $savedEmail and Password is $savedPassword");
          }
        },
        color: Colors.lightBlue,
        child: Text("Submit"),
      ),
    );
  }
}

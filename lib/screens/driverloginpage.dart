import 'package:etherrider/Allwidgets/ProgressDialog.dart';
import 'package:etherrider/brand_colors.dart';
import 'package:etherrider/main.dart';
import 'package:etherrider/screens/driverregistrationpage.dart';
import 'package:etherrider/screens/mainpage.dart';
import 'package:etherrider/screens/registrationpage.dart';
import 'package:etherrider/screens/riderordriver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverLoginPage extends StatelessWidget {
  static const String idScreen = "driverlogin";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('images/Capture.JPG'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'SignIn as a Driver',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage("enter Valid Email", context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "Password cannot be empty", context);
                        } else {
                          loginAndAuthenticateUser(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            BrandColors.colorGreen),
                        // background
                      ),
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand-Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, DriverRegistrationPage.idScreen, (route) => false);
                    },
                    child: Text(
                      'Don\'t have an account? SignUp Here',
                    )),
                    TextButton(onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, RiderOrDriver.idScreen, (route) => false);
                    }, child: Text("Back to selection page"))
              
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Authenticating Please wait ... ",
          );
        });

    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    )
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) //user created
    {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.idScreen, (route) => false);
          displayToastMessage("You are logged in", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("User doesn't exist", context);
        }
      });
    } else {
      Navigator.pop(context);
      // error occurred display error
      displayToastMessage("Error Occured", context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

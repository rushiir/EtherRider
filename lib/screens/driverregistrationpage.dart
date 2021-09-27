import 'package:etherrider/Allwidgets/ProgressDialog.dart';
import 'package:etherrider/main.dart';
import 'package:etherrider/screens/driverloginpage.dart';
import 'package:etherrider/screens/loginpage.dart';
import 'package:etherrider/screens/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:etherrider/brand_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverRegistrationPage extends StatelessWidget {

  static const String idScreen = "driverregister";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                SizedBox(height: 30,),
                Image(
                  alignment: Alignment.center,
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('images/Capture.JPG'),
                ),

                SizedBox(height:20,),
                Text('Create a Drivers Account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[

                    TextField(
                    controller: nameTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Full Name',
                    labelStyle: TextStyle(fontSize: 14,
                    ),
                    hintStyle: TextStyle(fontSize: 10,
                    color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 10,),


                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email Address',
                    labelStyle: TextStyle(fontSize: 14,
                    ),
                    hintStyle: TextStyle(fontSize: 10,
                    color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: phoneTextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone Number',
                    labelStyle: TextStyle(fontSize: 14,
                    ),
                    hintStyle: TextStyle(fontSize: 10,
                    color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 14,
                    ),
                    hintStyle: TextStyle(fontSize: 10,
                    color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 40),


                   ElevatedButton(
                  onPressed: () {

                    if(nameTextEditingController.text.length < 3)
                    {
                      displayToastMessage("Name must be atleast 3 Characters.", context);
                    }
                    else if(!emailTextEditingController.text.contains("@"))
                    {
                      displayToastMessage("enter Valid Email", context);
                    }
                    else if(phoneTextEditingController.text.isEmpty)
                    {
                      displayToastMessage("enter Phone Number", context);
                    }
                    else if(passwordTextEditingController.text.length < 8)
                    {
                      displayToastMessage("Password should be atleast 8 Characters", context);
                    }
                    else
                    {
                     registerNewUser(context);

                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(BrandColors.colorGreen),
                      // background
                  ),
                  child: 
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(fontSize: 18,fontFamily: 'Brand-Bold',
                        color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ),


                    ]
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, DriverLoginPage.idScreen, (route) => false);
                  },
                  child: Text('Already have a Drivers account? LOGIN',)
                  ),

                       ],
            ),
          ),
        ),
      ),
    );

  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  void registerNewUser(BuildContext context) async
  {
    showDialog(context: context, barrierDismissible: false,builder: (BuildContext context){
      return ProgressDialog(message: "Registering Please wait ... ",);
    });

    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
      email: emailTextEditingController.text, 
      password: passwordTextEditingController.text,
      ).catchError((errMsg){
        Navigator.pop(context);

        displayToastMessage("Error: "+ errMsg.toString(), context);
      }))
      .user;

      if(firebaseUser != null)    //user created
      {
        //save user info to database 
        Map userDataMap = 
        {
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim()
        };

        driversRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Account Created", context);

        //Navigator.pushNamedAndRemoveUntil(context, MainPage.idScreen, (route) => false);

      }
      else
      {
        Navigator.pop(context);

        // error occurred display error
        displayToastMessage("New user account has not been created", context);
      }
    }

    displayToastMessage(String message, BuildContext context){

      Fluttertoast.showToast(msg: message);
    }
}
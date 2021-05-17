import 'package:etherrider/brand_colors.dart';
import 'package:etherrider/screens/mainpage.dart';
import 'package:etherrider/screens/registrationpage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                SizedBox(height: 70,),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('images/logo.png'),
                ),

                SizedBox(height:40,),
                Text('SignIn as a Rider',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
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
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage())
                    );
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
                        'LOGIN',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage())
                    );
                  },
                  child: Text('Don\'t have an account? SignUp Here',)
                  ),

                       ],
            ),
          ),
        ),
      ),
    );
  }
}
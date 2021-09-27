import 'package:etherrider/Allwidgets/Divider.dart';
import 'package:etherrider/RegUI.dart';
import 'package:etherrider/brand_colors.dart';
import 'package:etherrider/screens/driverloginpage.dart';
import 'package:etherrider/screens/loginpage.dart';
import 'package:etherrider/screens/registrationpage.dart';
import 'package:flutter/material.dart';

class RiderOrDriver extends StatelessWidget {
  static const String idScreen = "riderordriver";
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
                  'Login as:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.idScreen, (route) => false);
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
                            'Rider',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand-Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    DividerWidget(),

                    Text(
                  'Or',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context, DriverLoginPage.idScreen, (route) => false);
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
                            'Driver',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand-Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                   DividerWidget(),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamedAndRemoveUntil(
                    //       context, RegUI.idScreen, (route) => false);
                    //   },
                    //   style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all<Color>(
                    //         BrandColors.colorGreen),
                    //     // background
                    //   ),
                    //   child: Container(
                    //     height: 50,
                    //     child: Center(
                    //       child: Text(
                    //         'RegUI',
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontFamily: 'Brand-Bold',
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]),
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.pushNamedAndRemoveUntil(
                //           context, RegistrationPage.idScreen, (route) => false);
                //     },
                //     child: Text(
                //       'Don\'t have an account? SignUp Here',
                //     )),
                    // TextButton(onPressed: () {
                    //   Navigator.pushNamedAndRemoveUntil(context, RiderOrDriver.idScreen, (route) => false);
                    // }, child: Text("Select"))
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
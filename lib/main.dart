import 'package:etherrider/DataHandler/AppData.dart';
import 'package:etherrider/RegUI.dart';
import 'package:etherrider/contract_linking.dart';
import 'package:etherrider/screens/driverloginpage.dart';
import 'package:etherrider/screens/driverregistrationpage.dart';
import 'package:etherrider/screens/loginpage.dart';
import 'package:etherrider/screens/registrationpage.dart';
import 'package:etherrider/screens/mainpage.dart';
import 'package:etherrider/screens/riderordriver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? const FirebaseOptions(
            appId: '1:297855924061:ios:c6de2b69b03a5be8',
            apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '297855924061',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : const FirebaseOptions(
            appId: '1:692790565628:android:bea7f26cc281214dc39579',
            apiKey: 'AIzaSyAAqShyLxHDS-qVLdPEs_1iNbc3Yheptu8',
            messagingSenderId: '297855924061',
            projectId: 'flutter-firebase-plugins',
            databaseURL: 'https://etherrider-96f03-default-rtdb.asia-southeast1.firebasedatabase.app',
          ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("Drivers");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContractLinking(),
          child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
          
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RiderOrDriver.idScreen,
        routes:{
          RegistrationPage.idScreen: (context) => RegistrationPage(),
          LoginPage.idScreen: (context) => LoginPage(),
          MainPage.idScreen: (context) => MainPage(),
          RiderOrDriver.idScreen: (context) => RiderOrDriver(),
          DriverLoginPage.idScreen: (context) => DriverLoginPage(),
          DriverRegistrationPage.idScreen: (context) => DriverRegistrationPage(),
          //RegUI.idScreen: (context) => RegUI(),
        }
      ),
    );
  }
}


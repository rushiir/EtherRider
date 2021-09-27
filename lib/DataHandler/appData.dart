import 'package:etherrider/Models/address.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier
{
  Address pickUpLocation;

  void updatePickUpLoctionAddress(Address pickUpAddress) 
  {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
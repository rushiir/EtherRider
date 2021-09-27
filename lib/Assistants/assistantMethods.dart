import 'package:etherrider/Assistants/requestAssistant.dart';
import 'package:etherrider/DataHandler/AppData.dart';
import 'package:etherrider/Models/address.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AssistantMethods
{
  static Future<String> searchCoordinateAddress(Position position, context) async
  {
    String st1, st2, st3, st4;
    String placeAddress = "";
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyAAqShyLxHDS-qVLdPEs_1iNbc3Yheptu8";
    
    var response = await RequestAssistant.getRequest(url);

    if(response!= "failed")
    {
      // placeAddress = response["results"][0]["formatted_address"];
      st1 = response["results"][0]["address_components"][3]["long_name"];
      st2 = response["results"][0]["address_components"][4]["long_name"];
      st3 = response["results"][0]["address_components"][5]["long_name"];
      st4 = response["results"][0]["address_components"][6]["long_name"];
      placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;

      Address userPickUpAddress = new Address();
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.placeName =placeAddress;

      Provider.of<AppData>(context, listen: false).updatePickUpLoctionAddress(userPickUpAddress);
    }

    return placeAddress;
  }
}
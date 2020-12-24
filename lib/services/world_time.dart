import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';



class WorldTime  {

  String time;
  String flag;
  String url;
  String location;
  bool isDaytime;

  // creating a named space paramter
  WorldTime({this.flag, this.url, this.location});


    Future<void> getTime() async {
      Response response = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);


    // extracting data from the map
    String timing = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // converting date time
    DateTime now = DateTime.parse(timing);
    now = now.add(Duration(hours: int.parse(offset)));

    // formating time

    isDaytime = now.hour > 6 && now.hour < 20 ? true: false;
    time = DateFormat.jm().format(now);

    print('time is $time');

    // tenarary operations for daytime or night time


    }
}



  

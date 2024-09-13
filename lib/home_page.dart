import 'package:flutter/material.dart';
import 'package:weather_app/no_weather_body.dart';
import 'package:weather_app/search_page.dart';
import 'package:weather_app/weather_model.dart';
import 'package:weather_app/weather_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi()
  {
    setState(() {

    });
  }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
IconButton(
    onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)
  {
    return SearchPage(
      updateUi: updateUi,
    );
  }));
},
    icon: Icon(Icons.search)),
        ],
        backgroundColor: Colors.blue,
        title: const Text('Weather App'),
      ),
     body: weatherData == null
      ? Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
           Text('There is no weather 🥲 start',
             style: TextStyle(
               fontSize: 30,
             ),
           ),
           Text(
               'Searching now 🔎 ',
             style: TextStyle(
               fontSize: 30,
             ),
           )
         ],
       ),
     ) : Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
             colors: [
               weatherData!.getThemeColor(),
               weatherData!.getThemeColor()[300]!,
               weatherData!.getThemeColor()[100]!,
             ],
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
         )
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Spacer(flex: 3,),
           Text(
             Provider.of<WeatherProvider>(context).cityName!,
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           Text(
             weatherData!.date,
             style: const TextStyle(
               fontSize: 22,
           ),
           ),
           Spacer(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Image.asset(weatherData!.getImage()),
               Text(
                 weatherData!.temp.toInt().toString(),
                 style: TextStyle(fontSize: 32,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Column(
                 children: [
                   Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                   Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                 ],
               )
             ],
           ),
           Spacer(),
           Text(
             weatherData!.weatherStateName,
             style: TextStyle(fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           Spacer(flex: 5,),
         ],
       ),
     ),
    );
  }
}

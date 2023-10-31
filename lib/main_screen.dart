import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/Additional_info.dart';
import 'package:weather_app/forecast_card.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Future<Map<String,dynamic>> getCurrent() async {
    try{
      String country = "London";
      String key = "a10ec18df7c7559b1200dbaa9cde34e4";
      final response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$country&APPID=$key'),
      );
      final data = jsonDecode(response.body);

      if(data['cod'] != 200){
        throw 'Error occured';
      }
      return data;
      }
      catch(e){
      throw e.toString();
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(onPressed:(){}, icon: Icon(Icons.refresh))
        ],
        title: const Text("Weather_Screen", style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.black,
      ),
      body:FutureBuilder(
        future: getCurrent() ,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('Error occurred'));
          }
          final data = snapshot.data!;
          final current = data["main"]["temp"] ;
          final sky = data["weather"][0]["main"];
          final humid = data ["main"]["humidity"];
          final pressure = data ["main"]["pressure"];
          final speed = data["wind"]["speed"];
          return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text('$current K',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        ),
                        SizedBox(height: 15),
                        Icon(
                         sky == "Clouds" || sky =="Rain"?
                         Icons.cloud:
                         Icons.sunny,size: 60,),
                        SizedBox(height: 15),
                        Text("$sky",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Weather Forecarst", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ForecastCard(time: "9:00", temp: "300.5",),
                    ForecastCard(time: "10:00", temp: "500.5"),
                    ForecastCard(time:"11:00" ,temp: "200",),
                    ForecastCard(time: "12:00",temp: "100",),
                    ForecastCard(time: "1:00",temp: "205.5",),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text("Additional Information", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Additional(icon: Icons.water_drop, text: "Humidity", value: "$humid %",),
                  Additional(icon: Icons.wind_power, text: "Wind-Speed",value: "$speed",),
                  Additional(icon: Icons.umbrella, text: "Pressure",value: "$pressure",),
                    ],
                  )
                ],
              ),
              );
        },
      ),
        );
  }
}








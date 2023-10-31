import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String time;
  final String temp;
  const ForecastCard({
    super.key,
    required this.time,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(time,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 7),
              Icon(Icons.cloud,size: 50,),
              SizedBox(height: 7,),
              Text(temp,
                style:TextStyle(
                  fontSize: 20,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/main_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home-Screen", style: TextStyle(
        fontWeight: FontWeight.bold,
        ),
        ),
      ),
      drawer:  NavigationDrawer(),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Text("Current-Location: "
                      "London",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),),
                  Icon(Icons.flag_circle_sharp, size: 65,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenu(context),
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context) => Container();
  Widget buildMenu(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.cloud) ,
          title: Text("Weather-Screen") ,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainScreen()
            )
            );
          }
        ),
        ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text("Choose-Location"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("About-Us"),
          onTap: (){},
        )
      ],
    ),
  );


}
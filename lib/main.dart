import 'package:carparking/const/app_strings.dart';
import 'package:carparking/local/cache_helper.dart';
import 'package:carparking/screen/home.dart';
import 'package:carparking/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';


void main() async {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = false;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFFFFEB3B,
          <int, Color>{
            50: Color(0xFFFFEB3B),
            100: Color(0xFFFFEB3B),
            200: Color(0xFFFFEB3B),
            300: Color(0xFFFFEB3B),
            400: Color(0xFFFFEB3B),
            500: Color(0xFFFFEB3B),
            600: Color(0xFFFFEB3B),
            700: Color(0xFFFFEB3B),
            800: Color(0xFFFFEB3B),
            900: Color(0xFFFFEB3B),
          },
        ),
      ),
      home: FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {

            return CircularProgressIndicator(); // Show a loading indicator if data is being fetched.
          } else if (snapshot.hasData && snapshot.data != null) {


            return HomePage(); // Show the HomePage if data (username) is available.
          } else {
            return LoginPage(); // Show the LoginPage if data is not available.
          }
        },
      ),
    );
  }

  getData() async{
    AppStrings.name= await CacheHelper.getData(key: "name")??"";
    AppStrings.email= await CacheHelper.getData(key: "email");
    AppStrings.phone= await CacheHelper.getData(key: "phone")??"";
  }
}

import 'package:carparking/screen/about.dart';
import 'package:carparking/screen/find_lot.dart';
import 'package:carparking/screen/login_screen.dart';
import 'package:carparking/screen/profile_page.dart';
import 'package:carparking/screen/setting.dart';
import 'package:carparking/view/home_screen.dart';
import 'package:carparking/view/user_current_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/google_places_api.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  Items item1 = Items(
      title: "Profile",
      subtitle: "",
      img: Icon(
        Icons.account_circle_sharp,
        size: 50,
      ));

  Items item2 = Items(
      title: "Find Lot",
      subtitle: "",
      img: Icon(
        Icons.location_on,
        size: 50,
      ));
  Items item3 = Items(
      title: "Setting",
      subtitle: "",
      img: Icon(
        Icons.settings,
        size: 50,
      ));
  Items item4 = Items(
      title: "About",
      subtitle: "",
      img: Icon(
        Icons.add_business_outlined,
        size: 50,
      ));
  Items item5 = Items(
      title: "Feedback",
      subtitle: "",
      img: Icon(
        Icons.feedback,
        size: 50,
      ));
  Items item6 = Items(
      title: "Logout",
      subtitle: "",
      img: Icon(
        Icons.logout,
        size: 50,
      ));

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];

    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: MaterialButton(
              onPressed: null,
              child: const Text(
                'Welcome to Home',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: myList.map((data) {
                return InkWell(
                  onTap: ()async {
                    print("object=> ${data.title}");
                    if (data.title.toString() == "Profile") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ProfilePage()));
                    }
                    if (data.title.toString() == "Find Lot") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GooglePlacesApiScreen()));
                    }
                    if (data.title.toString() == "Setting") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Setting()));
                    }
                    if (data.title.toString() == "About") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => About()));
                    }
                    if (data.title.toString() == "Feedback") {
                      showDialog(
                        context: context,
                        builder: (context) => _dialog,
                      );
                    }
                    if (data.title.toString() == "Logout") {
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      await sharedPreferences.clear();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        data.img!,
                        SizedBox(height: 14),
                        Text(
                          data.title!,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          data.subtitle!,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  final _dialog = RatingDialog(
    // your app's name?
    title: Text(
      'Rate Us On App Store',
      textAlign: TextAlign.center,
    ),
    // encourage your user to leave a high rating?
    message: Text('Select Number of Stars 1 - 5 to Rate This App'),
    // your app's logo?
    image: Center(child: Image.asset('assets/images/lambo.jpg')),
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        //go to app store
      }
    },
    submitButtonText: 'Submit',
  );
}

class Items {
  String? title;
  String? subtitle;
  String? event;
  Widget? img;

  Items({this.title, this.subtitle, this.event, this.img});
}

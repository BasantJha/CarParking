import 'package:carparking/local/cache_helper.dart';
import 'package:carparking/screen/dashboard.dart';
import 'package:carparking/screen/find_lot.dart';
import 'package:carparking/screen/login_screen.dart';
import 'package:carparking/screen/my_header_drawer.dart';
import 'package:carparking/screen/payment_details.dart';
import 'package:carparking/screen/profile_page.dart';
import 'package:carparking/screen/reserved_lot.dart';
import 'package:carparking/view/user_current_location.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container =  DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container =  ProfilePage();
    } else if (currentPage == DrawerSections.events) {
      container =  GetUserCurrentLocation();
    } else if (currentPage == DrawerSections.notes) {
      container = const ReservedLotDetails();
    } else if (currentPage == DrawerSections.settings) {
      container = const PaymentDetails();

    }
    return Scaffold(

      appBar: AppBar(
        title: const Text("Park my Car"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: ((context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text("Logout"),
                ),

              ];
            }),

            onSelected: (value) async{
              switch (value) {
                case 0:
                 try{
                   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    await sharedPreferences.clear();
                 }
                 catch(e){

                 }
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginPage()));



                  break;
              }
            },
          )
        ],
      ),

      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Find Lot", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "About", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
   
          menuItem(5, "Reserved Lot Details", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Payment Details", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          // const Divider(),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(alignment: Alignment.centerLeft,child: Text("Contact Us")),
          ),
          SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                SizedBox(width: 8,),
              Icon(Icons.feedback_outlined),
               SizedBox(width: 20,),
              InkWell(onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => _dialog,
                );
              },child: Text('Send Feedback',style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),)),
                Spacer(),
                SizedBox(width: 70,)
            ],)


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
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}

import 'package:carparking/const/app_strings.dart';
import 'package:carparking/local/cache_helper.dart';
import 'package:carparking/screen/home.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final emailcontriller = TextEditingController();

  final userName = TextEditingController();

  final phoneController = TextEditingController();

  final confirmPasswordController = TextEditingController();
  String?phone,email,name;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();



  }
  void loadData() async {

     userName.text = await CacheHelper.getData(key: 'name') ?? '';
     emailcontriller.text =await CacheHelper.getData(key: 'email') ?? '';
      phoneController.text =await CacheHelper.getData(key: 'phone') ?? '';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 100,
                    ),
                  ),
                  Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                          height: 46,
                          width: 46,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.white),
                            ),
                            color: Color(0xFFF5F6F9),
                            onPressed: () {},
                            // TODO: Icon not centered.
                            child:
                                Center(child: Icon(Icons.camera_alt_outlined)),
                          )))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.yellow.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: userName,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(

                    controller: emailcontriller,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(

                    controller: phoneController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Phone',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.circular(20)),
                    child: MaterialButton(
                      onPressed: ()async {


                         CacheHelper.saveData(key: 'name', value: userName.text);
                         CacheHelper.saveData(key: 'email', value: emailcontriller.text);
                         CacheHelper.saveData(key: 'phone', value: phoneController.text);

                         setState(() {
                           loadData();
                         });
print("email=> "+userName.text.toString());
print("email=> "+emailcontriller.text.toString());


                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

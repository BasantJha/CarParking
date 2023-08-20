import 'package:carparking/const/app_strings.dart';
import 'package:carparking/local/cache_helper.dart';
import 'package:carparking/screen/home.dart';
import 'package:carparking/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<SignUp> {
  final emailcontriller=TextEditingController();
  final userName=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add this key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/lambo.jpg')),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Card(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(children: [
                      const SizedBox(height: 10,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name';
                          }
                          // You can add more validation rules here if needed
                          return null; // Return null if the value is valid
                        },
                        controller: userName,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            labelText: 'Name',labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter your Name',hintStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          // You can add more validation rules here if needed
                          return null; // Return null if the value is valid
                        },
                        controller: emailcontriller,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            labelText: 'Email',labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter Email',hintStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          // You can add more validation rules here if needed
                          return null; // Return null if the value is valid
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            labelText: 'Password',labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter Password',hintStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Confirm password';
                          }
                          // You can add more validation rules here if needed
                          return null; // Return null if the value is valid
                        },
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            labelText: 'Confirm Password',labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter Confirm Password',hintStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.black, borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            CacheHelper.saveData(key: 'name', value: userName.text.toString());
                            CacheHelper.saveData(key: 'email', value: emailcontriller.text.toString());
                setState(() {
                  AppStrings.email=emailcontriller.text;
                  AppStrings.name=userName.text;
                });
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (_) => HomePage()));
                          }},
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have account? '),
                          InkWell(onTap: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (_) => LoginPage()));

                          },child: Text("SignIn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),

                        ],),


                    ],),
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

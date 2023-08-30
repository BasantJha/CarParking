import 'package:carparking/screen/booking_slot_screen/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: balckColor,
        title: const Text(
          "SMART CAR PARKING",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    width: 5,
                    color: Colors.orange.shade600,
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/profile.jpg"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Nitish kumar",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Text(
                  "Hello, My name is nitish kumar i am Currently Pursuing b.tech in electronic and communication, this is a Minor Project of Our college,  Project Name : 'SMART CAR PARKING' app, Our Team members : Nitish kumar , Sonu Kumar, Aditya Mishra and Jitendra Kumar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {},
                child: Container(
                  padding:const EdgeInsets.all(2),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: balckColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/icons/youtube.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () async {},
                child: Container(
                  padding:const EdgeInsets.all(2),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: balckColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/icons/linkeding.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () async {},
                child: Container(
                  padding: const EdgeInsets.all(2),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: balckColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/icons/github.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

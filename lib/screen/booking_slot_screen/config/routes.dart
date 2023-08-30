import 'package:carparking/screen/booking_slot_screen/pages/about_us/about_us.dart';
import 'package:get/get.dart';

import '../pages/parkingslot/parking_slot.dart';


var pages = [
  GetPage(
    name: '/homepage',
    page: () => ParkingSlotHome(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/about-us',
    page: () => AboutUs(),
    transition: Transition.rightToLeft,
  ),
];

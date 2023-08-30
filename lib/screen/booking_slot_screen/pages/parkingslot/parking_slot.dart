import 'package:carparking/screen/booking_slot_screen/components/floot_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../components/parking_slot.dart';
import '../../config/colors.dart';
import '../../controller/parking_controller.dart';

class ParkingSlotHome extends StatelessWidget {
  ParkingSlotHome({super.key});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade200,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const Text(
                "CAR PARKING",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          centerTitle: true,
        ),
        body: Obx(
          () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Parking Slots",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            FloorSelector(),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text("ENTRY"),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            isBooked: parkingController.slot1.value.booked,
                            isParked: parkingController.slot1.value.isParked,
                            slotName: "A-1",
                            slotId: parkingController.slot1KEY,
                            time: "",
                          ),
                        )),
                        const SizedBox(
                          width: 60,
                          child: VerticalDivider(
                            color: balckColor,
                            thickness: 1,
                          ),
                          height: 60,
                        ),
                        Expanded(
                          child: ParkingSlot(
                            isBooked: parkingController.slot2.value.booked,
                            isParked: parkingController.slot2.value.isParked,
                            slotName: "A-2",
                            slotId: parkingController.slot2KEY,
                            time: "",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            slotId: parkingController.slot3KEY,
                            isBooked: parkingController.slot3.value.booked,
                            isParked: parkingController.slot3.value.isParked,
                            time: "",
                            slotName: "A-3",
                          ),
                        )),
                        const SizedBox(
                          width: 60,
                          child: VerticalDivider(
                            color: balckColor,
                            thickness: 1,
                          ),
                          height: 60,
                        ),
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            slotId: parkingController.slot4KEY,
                            isBooked: parkingController.slot4.value.booked,
                            isParked: parkingController.slot4.value.isParked,
                            slotName: "A-4",
                            time: "",
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            slotId: parkingController.slot5KEY,
                            isBooked: parkingController.slot5.value.booked,
                            isParked: parkingController.slot5.value.isParked,
                            time: "",
                            slotName: "A-5",
                          ),
                        )),
                        const SizedBox(
                          width: 60,
                          child: VerticalDivider(
                            color: balckColor,
                            thickness: 1,
                          ),
                          height: 60,
                        ),
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            slotId: parkingController.slot6KEY,
                            isBooked: parkingController.slot6.value.booked,
                            isParked: parkingController.slot6.value.isParked,
                            slotName: "A-6",
                            time: "",
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            slotId: parkingController.slot7KEY,
                            isBooked: parkingController.slot7.value.booked,
                            isParked: parkingController.slot7.value.isParked,
                            slotName: "A-7",
                            time: "",
                          ),
                        )),
                        SizedBox(
                          width: 60,
                          child: VerticalDivider(
                            color: balckColor,
                            thickness: 1,
                          ),
                          height: 60,
                        ),
                        Expanded(
                            child: Obx(
                          () => ParkingSlot(
                            slotId: parkingController.slot8KEY,
                            isBooked: parkingController.slot8.value.booked,
                            isParked: parkingController.slot8.value.isParked,
                            slotName: "A-8",
                            time:"",
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("EXIT"),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Made By : Aditya Pal",
                          style: TextStyle(
                            color: lightBg,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

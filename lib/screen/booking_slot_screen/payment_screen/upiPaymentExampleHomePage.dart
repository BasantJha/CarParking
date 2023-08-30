import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upi_payment_flutter/upi_payment_flutter.dart';

class UpiPaymentExampleHomePage extends StatefulWidget {
  final String slotId;
  final double paymentId;
  const UpiPaymentExampleHomePage({super.key, required this.paymentId, required this.slotId});

  @override
  _UpiPaymentExampleHomePageState createState() =>
      _UpiPaymentExampleHomePageState();
}

class _UpiPaymentExampleHomePageState extends State<UpiPaymentExampleHomePage> {
  final upiPaymentHandler = UpiPaymentHandler();

  Future<void> _initiateTransaction() async {
    try {
      bool success = await upiPaymentHandler.initiateTransaction(
        payeeVpa: '7834822293@upi',
        payeeName: 'Car Parking',
        transactionRefId: 'TXN123456',
        transactionNote: 'Test transaction',
        amount: widget.paymentId,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaction initiated successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaction initiation failed.')),
        );
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initiateTransaction();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment Example'),
      ),

    );
  }
}
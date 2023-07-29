import 'package:flutter/material.dart';
class DeliveryTrakingScreen extends StatefulWidget {
  final String orderId;
  const DeliveryTrakingScreen({super.key, required this.orderId});

  @override
  State<DeliveryTrakingScreen> createState() => _DeliveryTrakingScreenState();
}

class _DeliveryTrakingScreenState extends State<DeliveryTrakingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text("Tracking /orderId = ${widget.orderId}}"),
      ),
    );
  }
}

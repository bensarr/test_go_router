import 'package:flutter/material.dart';
class OrderConfirmScreen extends StatefulWidget {
  final String orderId;
  const OrderConfirmScreen({super.key, required this.orderId});

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Confirmation /orderId = ${widget.orderId}"),),
    );
  }
}

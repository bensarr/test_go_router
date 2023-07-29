import 'package:flutter/material.dart';
class DeliveryDetailsScreen extends StatefulWidget {
  final String orderId;
  final String status;
  final String? delivererId;
  const DeliveryDetailsScreen({super.key, required this.orderId, required this.status, this.delivererId});

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Detail /orderId = ${widget.orderId} ? status = ${widget.status} ${widget.delivererId!=null?'& delivererId = '+widget.delivererId!:''}"),),
    );
  }
}

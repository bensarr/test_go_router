import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_go_router/core/navigations/router_names.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Histories"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final String location = context.namedLocation(
                  'historyItemOnListOrder',
                  pathParameters: {'orderId': '1'},
                  queryParameters: {'status': 'FINISHED', 'delivererId': '1'},
                );
                context.go(location);
              },
              child: Text('Item Finished'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final String location = context.namedLocation(
                  'historyItemOnListOrder',
                  pathParameters: {'orderId': '1'},
                  queryParameters: {'status': 'CANCELLED', 'delivererId': '1'},
                );
                context.go(location);
              },
              child: Text('Item Cancelled'),
            ),
          ],
        ),
      ),
    );
  }
}

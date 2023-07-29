import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("In progress Orders"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              final String location = context.namedLocation(
                'inProgressItemOnListOrder',
                pathParameters: {'orderId': '1'},
                queryParameters: {'status': 'IN_PROGRESS', 'delivererId': '1'},
              );
              context.go(location);
            },
            child: Text('Item IN_PROGRESS with deliverer'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              final String location = context.namedLocation(
                'inProgressItemOnListOrder',
                pathParameters: {'orderId': '1'},
                queryParameters: {'status': 'IN_PROGRESS'},
              );
              context.go(location);
            },
            child: Text('Item IN_PROGRESS without deliverer'),
          ),
        ],
      ),
    );
  }
}

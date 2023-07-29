import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_go_router/core/navigations/router_names.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Home Main"),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () =>
              context.go('${RouterNames.home}/${RouterNames.notifications}'),
          child: Text('Notifications'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            final String location = context.namedLocation(
                'confirmation',
                pathParameters: {'orderId': '1'},
            );
            context.go(location);
          },
          child: Text('Commander'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () =>
              context.go('${RouterNames.home}/${RouterNames.histories}'),
          child: Text('Voir Plus'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            final String location = context.namedLocation(
              'homeItemOnListOrder',
              pathParameters: {'orderId': '1'},
              queryParameters: {'status': 'FINISHED', 'delivererId': '1'},
            );
            context.go(location);
          },
          child: Text('on Tap item on List'),
        ),
      ],
    );
  }
}

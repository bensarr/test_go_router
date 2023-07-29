import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_go_router/core/navigations/router_names.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home Profile"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // TODO
              context.pushReplacementNamed(RouterNames.login);
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}

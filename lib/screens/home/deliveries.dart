import 'package:flutter/material.dart';
class FavoritesListWidget extends StatefulWidget {
  const FavoritesListWidget({super.key});

  @override
  State<FavoritesListWidget> createState() => _FavoritesListWidgetState();
}

class _FavoritesListWidgetState extends State<FavoritesListWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Deliveries"),);
  }
}

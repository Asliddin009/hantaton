import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [Icon(Icons.logo_dev),
            Text("Ханты-Мансийск")],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
      ],
        ),
        body:ListView(
      children: [
        Container(height: 120,child:
          Row(
            children: [
            ],
          )
          ,)
      ],
    ));
  }
}

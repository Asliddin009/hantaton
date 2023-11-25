import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellow.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Container()

                  ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 150),

          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
          ),
          width: double.infinity,
          height: double.infinity,
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main/ui/main_screen.dart';

class CardEvent extends StatefulWidget {
  const CardEvent({super.key});

  @override
  State<CardEvent> createState() => _CardEventState();
}

class _CardEventState extends State<CardEvent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset('assets/event_card.svg'),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back)
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.heart_fill)
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    "Югорский форум молодых специалистов",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                        Text(
                          "ул. Мира, 151, Ханты-Мансийск, Ханты-\nМансийский автономный округ.",
                          textAlign: TextAlign.left,
                      ),
                    ],
              ),
                ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(Icons.circle),
                    Text("ЮНИИИТ"),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(Icons.date_range),
                    Text("24 ноября в 15:00")
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Югорский НИИ информационных технологий приглашает молодых специалисов для развития личностных компетенций.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5),),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                child: Text("Образование", textAlign: TextAlign.left,),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hantaton_app/feature/home/domain/entity/event/event_entity.dart';

// ignore: must_be_immutable
class AppBottomSheet extends StatelessWidget {
  AppBottomSheet(
      {required this.context, required this.eventEntity, super.key});

  BuildContext context;
  EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: Colors.white),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
                width: double.infinity,
                  height: 300,
                  child: SvgPicture.asset('assets/event_card.svg')),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.heart_fill)
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
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "Югорский форум молодых специалистов",
                  style: TextStyle(
                      fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      "ул. Мира, 151, Ханты-Мансийск, Ханты-\nМансийский автономный округ.",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  children: [
                    Icon(Icons.circle),
                    Text("ЮНИИИТ"),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  children: [
                    Icon(Icons.date_range),
                    Text("24 ноября в 15:00")
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const Text(
                    "Югорский НИИ информационных технологий приглашает молодых специалисов для развития личностных компетенций.",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  )
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5),),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                child: const Text("Образование", textAlign: TextAlign.left,),
              )
            ],
          )
        ],
      ),
    );
  }
}

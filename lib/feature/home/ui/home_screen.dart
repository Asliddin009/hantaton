import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../../app/domain/notification/notification_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellow.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('dsa'),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 150),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: TextButton(
                onPressed: () async{
                  NotificationController.scheduleNewNotification(null);
                  },
                child: const Text("Поставить уведомление "),
              ),
            ))
      ],
    );
  }
}

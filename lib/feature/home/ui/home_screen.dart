import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hantaton_app/app/di/init_di.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';

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
          color: Colors.yellow.shade700,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Ханты-мансийск"),
                    Icon(Icons.date_range),
                    Text("25 ноября"),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      label: Text("Найти мероприятие"),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_alt_sharp)
                      )
                    ),
                  ),
                )
              ],
            ),
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Icon(Icons.arrow_forward),
                      icon: Text("Категории"),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(left: 15),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 16,),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.yellow.shade700,
                            ),
                              width: 100,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "Кино",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                          );
                        },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                      "Популярное в городе",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start
                    ,
                  ),
                  TextButton(
                    onPressed: () async{
                      NotificationController.scheduleNewNotification(null);
                      },
                    child: const Text("Поставить уведомление "),
                  ),
                  TextButton(
                    onPressed: () async{
                      locator.get<AuthCubit>().refreshToken();
                    },
                    child: const Text("Выйти"),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

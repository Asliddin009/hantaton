import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hantaton_app/app/di/init_di.dart';
import 'package:hantaton_app/app/ui/components/base_skeleton.dart';
import 'package:hantaton_app/feature/home/domain/state/cubit/home_cubit.dart';
import 'package:hantaton_app/feature/home/domain/utils.dart';
import 'package:hantaton_app/feature/home/ui/components/container_tile.dart';

import '../../../app/domain/notification/notification_controller.dart';
import 'components/event_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    locator.get<HomeCubit>().init();
    NotificationController.startListeningNotificationEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return BaseSkeletonizer(
            enabled: state.asyncSnapshot==const AsyncSnapshot.waiting(),
            child: Stack(
              children: [
                Container(
                  color: Colors.yellow.shade700,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text("Ханты-мансийск"),
                            Icon(Icons.date_range),
                            Text("25 ноября"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                                label: const Text("Найти мероприятие"),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.filter_alt_sharp))),
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
                      child: ListView(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: TextButton.icon(
                              onPressed: () {},
                              label: const Icon(Icons.arrow_forward),
                              icon: const Text("Категории"),
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: const EdgeInsets.only(left: 15),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.categoryList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 16,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(10)),
                                    color: Colors.yellow.shade700,
                                  ),
                                  width: 100,
                                  height: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(child: SvgPicture.asset(UtilsHome.getUrlSvg(state.categoryList[index].name)??"assets/book.svg")),


                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Популярное в городе",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          /*TextButton(
                            onPressed: () async {
                              NotificationController.scheduleNewNotification(
                                  null);
                            },
                            child: const Text("Поставить уведомление "),
                          ),*/
                          Container(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            height: 300,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.eventList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                              const SizedBox(
                                width: 16,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return ContainerTile(entity: state.eventList[index], onTap: () {
                                  showBottomSheet(context: context, builder: (context)=>AppBottomSheet(context: context, eventEntity:state.eventList[index]));
                                },);
                              },
                            ),
                          ),
                          const Text(
                            "Рекомендации",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            height: 300,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.eventList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                              const SizedBox(
                                width: 16,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/background_tile.png')),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                  ),
                                  width: 300,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Opacity(
                                        opacity:0.7,
                                        child: Container(
                                          height: 100,
                                          width: 280,
                                          decoration: const BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              children: [
                                                Text(
                                                  state.eventList[index].name,
                                                  style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      state.eventList[index]?.price==null?"Бесплатно":state.eventList[index]?.price.toString()??" ",
                                                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(
                                                      state.eventList[index].dateStart==null?"27 декабря":state.eventList[index].dateStart.toString()??" ",
                                                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                            ,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                        ],
                      ),
                    ))
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}

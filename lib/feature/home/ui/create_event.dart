import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hantaton_app/app/di/init_di.dart';
import 'package:hantaton_app/feature/home/domain/state/cubit/home_cubit.dart';

import '../../../app/ui/components/app_text_field.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final controllerName = TextEditingController();
  final controllerMoney = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerDate = TextEditingController();

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
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Row(
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
                        icon: const Icon(Icons.close)
                    ),
                  ],
                ),
                const Text(
                  "Создание мероприятия",
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
                    Form(
                        child: Column(
                            children: [
                              const SizedBox(height: 20,),
                              const Text(
                                  "название"
                              ),
                              AppTextField(controller: controllerName, labelText: "название"),
                              const SizedBox(height: 20,),
                              const Text(
                                  "цена"
                              ),
                              AppTextField(controller: controllerMoney, labelText: "цена"),
                              const SizedBox(height: 20,),
                              const Text(
                                  "возраст"
                              ),
                              AppTextField(controller: controllerAge, labelText: "возраст"),
                              const SizedBox(height: 20,),
                              const Text(
                                  "описание"
                              ),
                              AppTextField(controller: controllerDescription, labelText: "описание"),
                              const SizedBox(height: 20,),
                              const Text(
                                  "дата и время"
                              ),
                              AppTextField(controller: controllerDate, labelText: "дата и время"),
                              const SizedBox(height: 20,),
                              const Text("ФОТО СОБЫТИЯ(по желанию)"),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                    onPressed: () {},
                                    label: const Text("Прикрепить фото"),
                                    icon: const Icon(CupertinoIcons.paperclip),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: const Color.fromRGBO(69,90,100, 1),
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              const Text("укажите категорию"),
                              
                              const SizedBox(height: 20,),
                              const Text("место проведения"),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: ()async {try{

                                    Map<String,Object> res =
                                    {
                                      "name": controllerName.text,
                                      "description": controllerDescription.text,
                                      "date_start":'2023-11-25T23:16:28.688Z',
                                      "minimum_age": 0,
                                      "price": controllerMoney.text,
                                      "place": {
                                        "name": "Gostinka 2",
                                        "latitude": '10',
                                        "longitude": "10.00",
                                        "description": "1",
                                        "start_time": "14:33:19",
                                        "end_time": "14:33:20"
                                      },
                                      "category": {
                                        "name": "first"
                                      },
                                      "organizator": 1
                                    };
                                    await locator.get<HomeCubit>().createEvent(res);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Успешно создано мероприятие")));
                                  }catch(error){
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Что то пошло не так")));
                                  }
                                  },
                                  label: const Text("Отправить"),
                                  icon: const Icon(Icons.arrow_forward),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      backgroundColor: const Color.fromRGBO(69,90,100, 1),
                                      foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ]
                        )
                    ),
    ],
    ),
    ),
    )
    );
    }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                margin: EdgeInsets.all(30),
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
                        icon: Icon(Icons.arrow_back)
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.close)
                    ),
                  ],
                ),
                Text(
                  "Создание мероприятия",
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
                    Form(
                        child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Text(
                                  "название"
                              ),
                              AppTextField(controller: controllerName, labelText: "название"),
                              SizedBox(height: 20,),
                              Text(
                                  "цена"
                              ),
                              AppTextField(controller: controllerMoney, labelText: "цена"),
                              SizedBox(height: 20,),
                              Text(
                                  "возраст"
                              ),
                              AppTextField(controller: controllerAge, labelText: "возраст"),
                              SizedBox(height: 20,),
                              Text(
                                  "описание"
                              ),
                              AppTextField(controller: controllerDescription, labelText: "описание"),
                              SizedBox(height: 20,),
                              Text(
                                  "дата и время"
                              ),
                              AppTextField(controller: controllerDate, labelText: "дата и время"),
                              SizedBox(height: 20,),
                              Text("ФОТО СОБЫТИЯ(по желанию)"),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                    onPressed: () {},
                                    label: Text("Прикрепить фото"),
                                    icon: Icon(CupertinoIcons.paperclip),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: const Color.fromRGBO(69,90,100, 1),
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text("укажите категорию"),
                              
                              SizedBox(height: 20,),
                              Text("место проведения"),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: Text("Прикрепить фото"),
                                  icon: Icon(Icons.arrow_forward),
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

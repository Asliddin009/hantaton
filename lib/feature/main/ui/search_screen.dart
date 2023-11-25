import 'package:flutter/material.dart';
import 'package:hantaton_app/app/ui/components/app_text_button.dart';
import 'package:hantaton_app/feature/map/ui/map_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [
        AppTextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MapScreen()));
        }, text: "перейти к карте")
      ],),)/*CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title:  const Row(
              children: [
                SizedBox(width: 7,),
                Icon(Icons.logo_dev,color: Colors.orange,),
                SizedBox(width: 25,),
                Text("Ханты-Мансийск",style:TextStyle(color: Colors.black))
              ],
            ),
            //pinned: true,
            snap: true,
            floating: true,
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_sharp,color: Colors.black,))
            ],
          ),
           Column(
                  children: [
                      SizedBox(width: 400,height: 100,child:
                        Row(children: [
                          TextFormField(
                              onChanged: (value) {
                                //listEntity=Utils.searchList(state, value);
                                //setState(() {});
                              },
                              decoration: const InputDecoration(
                                icon: Icon(Icons.search),
                                labelStyle: TextStyle(letterSpacing: 2),
                                labelText: 'Поиск...',
                                border: OutlineInputBorder(),
                              )),
                          IconButton(onPressed: () {  }, icon: const Icon(Icons.filter_list_alt),)

                        ],)
                        ,),

                    ],
            ),
        ],
      )*/,
    );
  }
}

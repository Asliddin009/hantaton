import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hantaton_app/feature/main/ui/main_screen.dart';

class LikeCategory extends StatefulWidget {
  const LikeCategory({super.key});

  @override
  State<LikeCategory> createState() => _LikeCategoryState();
}

class _LikeCategoryState extends State<LikeCategory> with SingleTickerProviderStateMixin {
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                    },
                    icon: Icon(Icons.close)
                ),
              ],
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            "Расскажите \nо своих интересах!",
            style: TextStyle(
                fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            textAlign: TextAlign.center,
            "Чтобы предложить вам мероприятия, мы используем категории, которыми вы интересуетесь.",
            style: TextStyle(
                fontSize: 16
            ),
          ),
          SizedBox(height: 40,),
          Text(
              "Категории",
              style: TextStyle(
                fontSize: 16
              ),
            textAlign: TextAlign.left,
          ),
          Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/table_game.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/book.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/sport.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/school.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/theatre.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/concert.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/museum.svg', width: MediaQuery.of(context).size.width * 0.45,)
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/movie.svg')
              ),
            ]
          ),
          SizedBox(height: 20,),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                backgroundColor: Color.fromRGBO(69,90,100, 1),
                foregroundColor: Colors.white
              ),
                onPressed: () {},
                child: Text("Готово", textAlign: TextAlign.left),
            ),
          )
        ],
      ),
    );
  }
}

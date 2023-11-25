import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset('assets/page3.svg')
    );
  }
}

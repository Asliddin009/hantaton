import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset('assets/page3.svg')
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset('assets/page2.svg')
    );
  }
}

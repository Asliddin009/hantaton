import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BaseSkeletonizer extends StatelessWidget {
  const BaseSkeletonizer({
    super.key,
    required this.child,
    required this.enabled,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      justifyMultiLineText: true,
      effect: ShimmerEffect(
        baseColor: Theme.of(context).canvasColor,
        highlightColor: Colors.yellow.shade700,
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  final double? height, width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16 / 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: child,
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({
    super.key,
    this.size = 24,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}

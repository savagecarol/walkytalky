import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:walkytalky/global/AppColors.dart';

class Customloader extends StatelessWidget {
  final double size;
  const Customloader({super.key , required this.size});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
        color: AppColors.primaryVariant,
        size: size,
      );
  }
}
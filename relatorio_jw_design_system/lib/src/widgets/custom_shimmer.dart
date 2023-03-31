import 'package:flutter/material.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget? child;

  final Color baseColor;

  final double height;

  final double width;

  const CustomShimmer({
    this.child,
    this.baseColor = CustomColors.black,
    this.height = 30,
    this.width = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: baseColor.withOpacity(0.27),
      child: child != null
          ? child!
          : _RoundedContainer(
              color: CustomColors.white,
              height: height,
              width: width,
              child: child,
            ),
    );
  }
}

class _RoundedContainer extends StatelessWidget {
  final Widget? child;

  final double? width;

  final double? height;

  final Color color;

  const _RoundedContainer({
    this.child,
    this.width,
    this.height,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: child,
    );
  }
}

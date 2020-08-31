import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardLoad extends StatelessWidget {
  final double height;

  const ShimmerCardLoad({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          height == null ? EdgeInsets.only(left: 10) : EdgeInsets.only(top: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.green,
        child: Container(
          width: Get.width * 0.43,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(2, 3),
                color: Colors.black.withOpacity(0.8),
              )
            ],
          ),
          height: height ?? Get.height,
        ),
      ),
    );
  }
}

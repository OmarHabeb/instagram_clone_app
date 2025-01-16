import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryIcon extends StatelessWidget {
  final int? index;
   String image;
  StoryIcon({this.index,required this.image });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 110.h,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: Container(
              width: 72.w,
              height: 92.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
                image: DecorationImage(
                  // image: AssetImage(image),
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

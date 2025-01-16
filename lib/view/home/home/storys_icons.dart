import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/core/style/widgets/story_icon.dart';

class StorysIcons extends StatelessWidget {
  const StorysIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return StoryIcon(
          index: index,
          image: 'assets/profile.jpg',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10.w,
        );
      },
      itemCount: 10,
    );
  }
}

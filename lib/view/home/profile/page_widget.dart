import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/view/home/profile/page/post_page.dart';
import 'package:instagram_clone_app/view/home/profile/page/real_page.dart';
import 'package:instagram_clone_app/view/home/profile/page/tage_page.dart';

class PageWidget extends StatelessWidget {
   PageWidget({super.key});
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
     List<Map<String, dynamic>> pages = [
      {"Icon": Icons.table_chart, "page": PostPage()},
      {"Icon": Icons.ondemand_video_outlined, "page": RealPage()},
      {"Icon": Icons.person_pin_rounded, "page": TagePage()},
    ];
    final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {

   
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: currentIndex,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(pages.length, (index) {
                  return IconButton(
                    icon: Icon(
                      pages[index]["Icon"],
                      color: value == index ? Colors.white : Colors.grey,
                    ),
                    onPressed: () {
                      currentIndex.value = index;
                            _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  );
                }),
              );
            },
          ),
          SizedBox(
            height: 40.h,
          ),
         Container(
          height:400 ,
           child: PageView.builder(
                  controller: _pageController,    
             onPageChanged: (value) {
               currentIndex.value = value;
             },
             itemCount: pages.length,
             itemBuilder: (context, index) {
               return pages[index]["page"];
             },
           ),
         ),
        ],
      ),
    );
  }
}


// ValueListenableBuilder<int>(
//         valueListenable: currentIndex,
//         builder: (context, index, child) {
//           return screens[index];
//         },
//       )

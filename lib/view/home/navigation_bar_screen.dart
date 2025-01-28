import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/home/home_cubit.dart';
import 'package:instagram_clone_app/view/home/home/home_screen.dart';
import 'package:instagram_clone_app/view/home/profile/profile_screen.dart';
import 'package:instagram_clone_app/view/home/reals/reals_screen.dart';
import 'package:instagram_clone_app/view/home/search/search_screen.dart';
import 'package:instagram_clone_app/view/home/shopping/shopping_screen.dart';

class NavigationBarScreeen extends StatelessWidget {
  const NavigationBarScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    var cubit = HomeCubit.get(context);

    List<Widget> screens = [
      HomeScreen(),
      SearchScreen(),
      RealsScreen(),
      ShoppingScreen(),
      ProfileScreen()
    ];
    return Scaffold(
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, index, child) {
            return BottomNavigationBar(
                backgroundColor: Colors.black,
                onTap: (value) {
                  currentIndex.value = value;
                },
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                currentIndex: index,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search_rounded), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.video_collection), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_travel), label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                        width: 24.w,
                        height: 34.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                NetworkImage(cubit.getUserImage().toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      label: "")
                ]);
          },
        ),
        body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return screens[index];
        },
      ),);
  }
}

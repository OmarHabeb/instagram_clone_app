import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/auth/auth_cubit.dart';
import 'package:instagram_clone_app/view/home/home/home_screen.dart';
import 'package:instagram_clone_app/view/home/home/profile_screen.dart';
import 'package:instagram_clone_app/view/home/home/reals_screen.dart';
import 'package:instagram_clone_app/view/home/home/search_screen.dart';
import 'package:instagram_clone_app/view/home/home/shopping_screen.dart';

class NavigationBarScreeen extends StatelessWidget {
  const NavigationBarScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> indexn = ValueNotifier<int>(0);

    var cubit = AuthCubit.get(context);
    final _pageController = PageController();

    List<Widget> screens = [
      HomeScreen(),
      SearchScreen(),
      RealsScreen(),
      ShoppingScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: indexn,
        builder: (context, index, child) {
          return BottomNavigationBar(
              onTap: (value) {
                indexn.value = value;
                _pageController.jumpToPage(value);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
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
                          image: NetworkImage(cubit.pathProfileImage()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    label: "")
              ]);
        },
      ),
      body: PageView(
        controller: _pageController,
        children: screens,
        onPageChanged: (value) {
          indexn.value = value;
        },
      ),
    );
  }
}

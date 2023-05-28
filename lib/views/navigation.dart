import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../util/BottomNavController.dart';
import 'SwipeScreen.dart';
import 'list.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarRoutes extends StatelessWidget {
  NavBarRoutes({Key? key}) : super(key: key);

  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentIndex = bottomNavigationController.currentIndex.value;

        // Replace with your desired screen widgets based on currentIndex
        Widget screen;

        switch (currentIndex) {
          case 0:
            screen = const ListViewScreen();
            break;
          case 1:
            screen = const SwipeScreen();
            break;

          default:
            screen = const ListViewScreen();
            break;
        }

        return screen;
      }),
      bottomNavigationBar: Obx(() {
        final currentIndex = bottomNavigationController.currentIndex.value;

        return Container(
          decoration: BoxDecoration(color: const Color(0xff303030), boxShadow: [
            // BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: GNav(
                // rippleColor: Color.fromARGB(255, 59, 59, 59),
                hoverColor: Colors.grey[200]!,
                // gap: 0,
                activeColor: Color.fromARGB(255, 48, 48, 48),
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                duration: const Duration(milliseconds: 500),
                tabBackgroundColor: Colors.grey[300]!,
                color: Colors.grey[400],
                mainAxisAlignment: MainAxisAlignment.center,
                tabBorderRadius: 16,
                tabs: const [
                  GButton(
                    icon: Icons.list_alt_outlined,
                  ),
                  GButton(
                    icon: Icons.play_arrow,
                  ),
                ],
                selectedIndex: currentIndex,
                onTabChange: bottomNavigationController.changeIndex,
              ),
            ),
          ),
        );
      }),
    );
  }
}




// const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.list_alt_outlined), label: "List"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.play_arrow), label: "Play"),
//           ],
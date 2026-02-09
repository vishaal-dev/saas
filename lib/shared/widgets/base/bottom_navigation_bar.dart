import 'package:flutter/material.dart';
import '../../../core/di/get_injector.dart';
import '../../../routes/app_pages.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Color primaryColor;

  const CustomBottomNavigationBar({super.key, this.primaryColor = Colors.blue});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0; // Tracks the selected container index

  void _onItemTapped(int index, String route) {
    setState(() {
      selectedIndex = index;
    });
    appNav.changePage(route);
  }

  Widget _buildNavItem({
    required int index,
    required String asset,
    required String route,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index, route),
      child: Container(
        width: 67,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF121212) : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0xFF121212)),
        ),
        child: Image.asset(
          asset,
          width: 24,
          height: 24,
          color: isSelected ? Colors.white : const Color(0xFF121212),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
              margin: const EdgeInsets.only(bottom: 8.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  index: 0,
                  asset: 'assets/icons/house.png',
                  route: AppRoutes.home,
                ),
                _buildNavItem(
                  index: 1,
                  asset: 'assets/icons/layout-grid.png',
                  route: AppRoutes.categories,
                ),
                _buildNavItem(
                  index: 2,
                  asset: 'assets/icons/gift.png',
                  route: AppRoutes.rewards,
                ),
                _buildNavItem(
                  index: 3,
                  asset: 'assets/icons/user.png',
                  route: AppRoutes.profile,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

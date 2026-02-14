import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';
import '../common/app_bar.dart';
import 'drawer/drawer.dart';

class BottomNavScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends ConsumerState<BottomNavScreen> {
  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Image.asset(
          'assets/logo/cyber_logo.png',
          color: BrandColors.textLight,
          height: 36,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(
            Icons.storefront_rounded,
            color: BrandColors.textLight,
            size: AppSizes.iconSizeLg,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: 'Menu',
          ),
        ),
        actions: [
          _NotificationAction(
            count: 0,
            onTap: () {
              // TODO: Navigate to notifications
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: widget.navigationShell,
      bottomNavigationBar: Theme(
        data: ThemeData.light().copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: BrandColors.transparent,
          highlightColor: BrandColors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: widget.navigationShell.currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: BrandColors.primary,
          unselectedItemColor: BrandColors.textSecondary,
          backgroundColor: BrandColors.surface,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tag),
              activeIcon: Icon(CupertinoIcons.tag_fill),
              label: 'Sell',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cube_box),
              activeIcon: Icon(CupertinoIcons.cube_box_fill),
              label: 'Stock',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_right_arrow_left),
              activeIcon: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill),
              label: 'Transaction',
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationAction extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const _NotificationAction({required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.notifications_outlined),
          if (count > 0)
            Positioned(
              top: -AppSizes.xs,
              right: -AppSizes.xs,
              child: Container(
                padding: const EdgeInsets.all(AppSizes.xs),
                decoration: BoxDecoration(
                  color: BrandColors.error,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: BrandColors.textLight,
                    width: AppSizes.br,
                  ),
                ),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: Text(
                  count > 99 ? '99+' : count.toString(),
                  style: context.caption(color: BrandColors.textLight, bold: true).copyWith(fontSize: AppSizes.fontSizeCaption),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

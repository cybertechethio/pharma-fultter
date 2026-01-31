import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../routes/route_name.dart';
import '../../../features/profile/presentation/providers/profile_notifier.dart';
import '../../../features/auth/domain/entities/user.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final userAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Badge(
            label: const Text('3'),
            child: IconButton( 
              icon: const Icon(Icons.notifications_outlined),
              tooltip: 'Notifications',
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () => context.push(RouteName.profile),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAvatar(userAsync, colorScheme),
                    const SizedBox(width: 8),
                    _buildUserName(userAsync),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SafeArea(child: widget.navigationShell),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: widget.navigationShell.currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurfaceVariant,
          backgroundColor: colorScheme.surface,
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

  Widget _buildAvatar(AsyncValue<User?> userAsync, ColorScheme colorScheme) {
    return userAsync.when(
      data: (user) {
        if (user == null) {
          return CircleAvatar(
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(Icons.person, color: colorScheme.onPrimaryContainer),
          );
        }

        // User has profile picture
        if (user.profilePicture != null && user.profilePicture!.isNotEmpty) {
          // Calculate initials for fallback
          final initials = user.fullName
              .split(' ')
              .map((n) => n.isNotEmpty ? n[0].toUpperCase() : '')
              .take(2)
              .join();
          
          return ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.profilePicture!,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                radius: 16,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                  ),
                ),
              ),
              errorWidget: (context, url, error) {
                // Fallback to initials if image fails to load
                return CircleAvatar(
                  backgroundColor: colorScheme.primary.withOpacity(0.1),
                  radius: 16,
                  child: Text(
                    initials.isNotEmpty ? initials : 'U',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          );
        }

        // No profile picture - show initials
        final initials = user.fullName
            .split(' ')
            .map((n) => n.isNotEmpty ? n[0].toUpperCase() : '')
            .take(2)
            .join();
        
        return CircleAvatar(
          backgroundColor: colorScheme.primary.withOpacity(0.1),
          child: Text(
            initials.isNotEmpty ? initials : 'U',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        );
      },
      loading: () => CircleAvatar(
        backgroundColor: colorScheme.primaryContainer,
        radius: 16,
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          ),
        ),
      ),
      error: (_, __) => CircleAvatar(
        backgroundColor: colorScheme.primaryContainer,
        child: Icon(Icons.person, color: colorScheme.onPrimaryContainer),
      ),
    );
  }

  Widget _buildUserName(AsyncValue<User?> userAsync) {
    return userAsync.when(
      data: (user) {
        if (user == null) {
          return Text(
            'Profile',
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          );
        }
        
        // Truncate name if longer than 7 characters
        final displayName = user.fullName.length > 7
            ? '${user.fullName.substring(0, 7)}...'
            : user.fullName;
        
        return Text(
          displayName,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      },
      loading: () => Text(
        'Profile',
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
      error: (_, __) => Text(
        'Profile',
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}



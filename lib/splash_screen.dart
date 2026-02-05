import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/providers/auth_providers.dart';
import 'routes/route_name.dart';
import 'app/theme/app_sizes.dart';
import 'app/theme/brand_colors.dart';
import 'app/theme/app_images.dart';

/// Splash screen - First screen that runs after app launch
/// Checks if user access token exists in local storage
/// If token exists, navigates to home screen
/// If token doesn't exist, navigates to login screen
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    try {
      // Get the local data source to check for access token
      final localDataSource = await ref.read(authLocalDataSourceProvider.future);
      
      // Check if access token exists
      final accessToken = await localDataSource.getAccessToken();

      // Navigate based on token existence
      if (!mounted) return;
      
      if (accessToken != null && accessToken.isNotEmpty) {
        // Token exists, navigate to home
        context.go(RouteName.home);
      } else {
        // No token, navigate to login
        context.go(RouteName.login);
      }
    } catch (e) {
      // If there's an error checking token, navigate to login
      if (!mounted) return;
      context.go(RouteName.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.asset(
              AppImages.cyberLogo,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: AppSizes.xxxl),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

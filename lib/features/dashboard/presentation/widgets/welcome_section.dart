import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../profile/presentation/providers/profile_notifier.dart';

/// Welcome section widget showing greeting and user name
class WelcomeSection extends ConsumerWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(profileProvider);
    final greeting = _getTimeBasedGreeting();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl),
      child: userAsync.when(
        data: (user) {
          final displayName = user != null
              ? '${user.firstName} ${user.lastName}'.trim()
              : 'Guest';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: context.body(color: BrandColors.textSecondary, bold: true)
                    .copyWith(letterSpacing: 0.3),
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                displayName,
                style: context.title(color: BrandColors.textPrimary, bold: true)
                    .copyWith(
                  fontSize: AppSizes.fontSizeTitle,
                  letterSpacing: 0.3,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
        loading: () => _buildWelcomeShimmer(context),
        error: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: context.body(color: BrandColors.textSecondary, bold: true),
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              'Guest',
              style: context.title(color: BrandColors.textPrimary, bold: true)
                  .copyWith(fontSize: AppSizes.fontSizeTitle),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeShimmer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: AppSizes.md2,
          decoration: BoxDecoration(
            color: BrandColors.textDisabled.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppSizes.radiusXs),
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        Container(
          width: 150,
          height: AppSizes.xl + AppSizes.xs,
          decoration: BoxDecoration(
            color: BrandColors.textDisabled.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppSizes.radiusXs),
          ),
        ),
      ],
    );
  }

  String _getTimeBasedGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../features/branch/domain/entities/branch.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';

/// A beautiful, expandable branch switcher with card-like design.
class DrawerBranchSwitcher extends ConsumerStatefulWidget {
  final String? activeBranchId;
  final String? activeBranchName;
  final Function(Branch) onBranchSelected;

  const DrawerBranchSwitcher({
    super.key,
    this.activeBranchId,
    this.activeBranchName,
    required this.onBranchSelected,
  });

  @override
  ConsumerState<DrawerBranchSwitcher> createState() =>
      _DrawerBranchSwitcherState();
}

class _DrawerBranchSwitcherState extends ConsumerState<DrawerBranchSwitcher>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isHovered = false;
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOutCubic),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final branchesAsync = ref.watch(localBranchesProviderProvider);

    final isActive = _isExpanded || _isHovered;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.xxs),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: _isExpanded
                ? colorScheme.surfaceContainerHighest.withOpacity(0.4)
                : _isHovered
                    ? colorScheme.surfaceContainerHighest.withOpacity(0.4)
                    : BrandColors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.radius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: BrandColors.transparent,
                child: InkWell(
                  onTap: _toggleExpand,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.md2,
                    vertical: AppSizes.sm,
                  ),
                  child: Row(
                    children: [
                      // Icon - brand color, 50% opacity when inactive (match other drawer items)
                      Icon(
                        Icons.storefront_outlined,
                        size: AppSizes.iconSizeLg - 2,
                        color: BrandColors.primary.withValues(
                          alpha: isActive ? 1.0 : 0.5,
                        ),
                      ),
                      const SizedBox(width: AppSizes.md2),
                        // Selected branch name only
                        Expanded(
                          child: Text(
                            widget.activeBranchName ?? 'Select Branch',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight:
                                  isActive ? FontWeight.w600 : FontWeight.w500,
                              color: isActive
                                  ? colorScheme.onSurface
                                  : colorScheme.onSurfaceVariant,
                              letterSpacing: 0.1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Expand Icon
                        RotationTransition(
                          turns: _rotationAnimation,
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 20,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Expandable Branch List
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: _buildBranchList(branchesAsync),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
                sizeCurve: Curves.easeInOutCubic,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranchList(AsyncValue<List<Branch>?> branchesAsync) {
    return branchesAsync.when(
      loading: () => Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Center(
          child: SizedBox(
            width: AppSizes.iconSize,
            height: AppSizes.iconSize,
            child: const CircularProgressIndicator(strokeWidth: AppSizes.loaderStrokeWidth),
          ),
        ),
      ),
      error: (error, stack) => const SizedBox.shrink(),
      data: (branches) {
        if (branches == null || branches.isEmpty) return const SizedBox.shrink();

        final availableBranches =
            branches.where((b) => b.id != widget.activeBranchId).toList();

        if (availableBranches.isEmpty) return const SizedBox.shrink();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md2),
              child: Divider(height: AppSizes.xxs, thickness: 0.5),
            ),
            ...availableBranches.map((branch) => _BranchItem(
                  branch: branch,
                  onTap: () {
                    _toggleExpand();
                    widget.onBranchSelected(branch);
                  },
                )),
            const SizedBox(height: AppSizes.xs),
          ],
        );
      },
    );
  }
}

class _BranchItem extends StatelessWidget {
  final Branch branch;
  final VoidCallback onTap;

  const _BranchItem({
    required this.branch,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: BrandColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md2,
            vertical: AppSizes.sm2,
          ),
          child: Row(
            children: [
              // Branch Icon Container
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Center(
                  child: Text(
                    branch.name.isNotEmpty ? branch.name[0].toUpperCase() : '?',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.md),
              // Branch Name
              Expanded(
                child: Text(
                  branch.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Arrow
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: AppSizes.md2,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


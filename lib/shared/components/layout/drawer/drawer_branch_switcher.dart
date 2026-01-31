import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          color: _isExpanded
              ? colorScheme.surfaceContainerHighest.withOpacity(0.5)
              : colorScheme.surfaceContainerHighest.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isExpanded
                ? colorScheme.primary.withOpacity(0.3)
                : colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Header (always visible)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _toggleExpand,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      // Branch Icon
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              colorScheme.tertiary,
                              colorScheme.tertiary.withOpacity(0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.tertiary.withOpacity(0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.storefront_rounded,
                          size: 20,
                          color: colorScheme.onTertiary,
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Branch Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Branch',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.activeBranchName ?? 'Select Branch',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Expand Icon
                      RotationTransition(
                        turns: _rotationAnimation,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: colorScheme.onSurfaceVariant,
                          ),
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
    );
  }

  Widget _buildBranchList(AsyncValue<List<Branch>?> branchesAsync) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return branchesAsync.when(
      loading: () => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colorScheme.primary,
            ),
          ),
        ),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Failed to load branches',
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.error,
          ),
        ),
      ),
      data: (branches) {
        if (branches == null || branches.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'No branches available',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        // Filter out active branch
        final availableBranches = branches
            .where((b) => b.id != widget.activeBranchId)
            .toList();

        if (availableBranches.isEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              'No other branches available',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return Column(
          children: [
            Divider(
              height: 1,
              indent: 16,
              endIndent: 16,
              color: colorScheme.outlineVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 8),
            ...availableBranches.map((branch) => _BranchItem(
                  branch: branch,
                  onTap: () {
                    _toggleExpand();
                    widget.onBranchSelected(branch);
                  },
                )),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class _BranchItem extends StatefulWidget {
  final Branch branch;
  final VoidCallback onTap;

  const _BranchItem({
    required this.branch,
    required this.onTap,
  });

  @override
  State<_BranchItem> createState() => _BranchItemState();
}

class _BranchItemState extends State<_BranchItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: _isHovered
                ? colorScheme.primaryContainer.withOpacity(0.4)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    // Branch Avatar
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          widget.branch.name.isNotEmpty
                              ? widget.branch.name[0].toUpperCase()
                              : '?',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Branch Name
                    Expanded(
                      child: Text(
                        widget.branch.name,
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
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


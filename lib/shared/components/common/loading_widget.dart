import 'package:flutter/material.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Loading widget component with multiple variants
/// 
/// Supports different loading states:
/// - Circular: Standard circular progress indicator
/// - Linear: Linear progress indicator
/// - Shimmer: Skeleton loading effect
/// - Custom: Custom loading animation
class LoadingWidget extends StatelessWidget {
  /// Loading variant
  final LoadingVariant variant;
  
  /// Loading size
  final LoadingSize size;
  
  /// Custom color (overrides theme)
  final Color? color;
  
  /// Background color for shimmer effect
  final Color? backgroundColor;
  
  /// Stroke width for circular progress
  final double? strokeWidth;
  
  /// Custom message to display
  final String? message;
  
  /// Whether to show message
  final bool showMessage;
  
  /// Custom loading indicator
  final Widget? customIndicator;
  
  /// Animation duration for shimmer
  final Duration? animationDuration;
  
  /// Border radius for shimmer items
  final BorderRadius? borderRadius;

  const LoadingWidget({
    super.key,
    this.variant = LoadingVariant.circular,
    this.size = LoadingSize.medium,
    this.color,
    this.backgroundColor,
    this.strokeWidth,
    this.message,
    this.showMessage = false,
    this.customIndicator,
    this.animationDuration,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final loadingColor = color ?? BrandColors.primary;
    final sizeValue = _getSizeValue(size);
    
    Widget indicator = _buildIndicator(context, loadingColor, sizeValue);
    
    if (showMessage && message != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator,
          const SizedBox(height: AppSizes.lg),
          Text(
            message!,
            style: context.body(color: BrandColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
    
    return indicator;
  }
  
  Widget _buildIndicator(
    BuildContext context,
    Color loadingColor,
    double sizeValue,
  ) {
    switch (variant) {
      case LoadingVariant.circular:
        return _buildCircularIndicator(loadingColor, sizeValue);
      case LoadingVariant.linear:
        return _buildLinearIndicator(loadingColor);
      case LoadingVariant.shimmer:
        return _buildShimmerIndicator(context, sizeValue);
      case LoadingVariant.custom:
        return customIndicator ?? _buildCircularIndicator(loadingColor, sizeValue);
    }
  }
  
  Widget _buildCircularIndicator(Color color, double size) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: strokeWidth ?? (size / 8).clamp(2.0, 4.0),
      ),
    );
  }
  
  Widget _buildLinearIndicator(Color color) {
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      backgroundColor: backgroundColor,
    );
  }
  
  Widget _buildShimmerIndicator(BuildContext context, double size) {
    return _ShimmerLoading(
      duration: animationDuration ?? const Duration(milliseconds: 1500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ShimmerItem(
            width: size,
            height: size,
            borderRadius: borderRadius ?? BorderRadius.circular(size / 2),
          ),
          if (showMessage && message != null) ...[
            const SizedBox(height: AppSizes.lg),
            _ShimmerItem(
              width: 120,
              height: AppSizes.lg,
              borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusSm),
            ),
          ],
        ],
      ),
    );
  }
  
  double _getSizeValue(LoadingSize size) {
    switch (size) {
      case LoadingSize.small:
        return 20;
      case LoadingSize.medium:
        return 32;
      case LoadingSize.large:
        return 48;
    }
  }
}

/// Loading variants
enum LoadingVariant {
  circular,
  linear,
  shimmer,
  custom,
}

/// Loading sizes
enum LoadingSize {
  small,
  medium,
  large,
}

/// Shimmer loading effect
class _ShimmerLoading extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const _ShimmerLoading({
    required this.child,
    required this.duration,
  });

  @override
  State<_ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<_ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                BrandColors.surfaceVariant,
                BrandColors.surfaceContainerHighest,
                BrandColors.surfaceVariant,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

/// Shimmer item for skeleton loading
class _ShimmerItem extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const _ShimmerItem({
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: BrandColors.textDisabled,
        borderRadius: borderRadius,
      ),
    );
  }
}

/// Convenience constructors for common loading states
extension LoadingWidgetConstructors on LoadingWidget {
  /// Small circular loading
  static LoadingWidget small({
    Color? color,
    String? message,
    bool showMessage = false,
    Key? key,
  }) {
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.circular,
      size: LoadingSize.small,
      color: color,
      message: message,
      showMessage: showMessage,
    );
  }
  
  /// Medium circular loading
  static LoadingWidget medium({
    Color? color,
    String? message,
    bool showMessage = false,
    Key? key,
  }) {
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.circular,
      size: LoadingSize.medium,
      color: color,
      message: message,
      showMessage: showMessage,
    );
  }
  
  /// Medium circular loading with localized message
  static LoadingWidget mediumLocalized({
    required BuildContext context,
    Color? color,
    String? message,
    bool showMessage = false,
    Key? key,
  }) {
    final l10n = AppLocalizations.of(context);
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.circular,
      size: LoadingSize.medium,
      color: color,
      message: message ?? l10n.loadingData,
      showMessage: showMessage,
    );
  }
  
  /// Large circular loading
  static LoadingWidget large({
    Color? color,
    String? message,
    bool showMessage = false,
    Key? key,
  }) {
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.circular,
      size: LoadingSize.large,
      color: color,
      message: message,
      showMessage: showMessage,
    );
  }
  
  /// Linear loading
  static LoadingWidget linear({
    Color? color,
    Color? backgroundColor,
    Key? key,
  }) {
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.linear,
      color: color,
      backgroundColor: backgroundColor,
    );
  }
  
  /// Shimmer loading
  static LoadingWidget shimmer({
    LoadingSize size = LoadingSize.medium,
    String? message,
    bool showMessage = false,
    Duration? animationDuration,
    BorderRadius? borderRadius,
    Key? key,
  }) {
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.shimmer,
      size: size,
      message: message,
      showMessage: showMessage,
      animationDuration: animationDuration,
      borderRadius: borderRadius,
    );
  }
  
  /// Custom loading
  static LoadingWidget custom({
    required Widget indicator,
    String? message,
    bool showMessage = false,
    Key? key,
  }) {
    return LoadingWidget(
      key: key,
      variant: LoadingVariant.custom,
      customIndicator: indicator,
      message: message,
      showMessage: showMessage,
    );
  }
}

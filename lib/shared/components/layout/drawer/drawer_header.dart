import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/utils/url_utils.dart';

/// A stunning drawer header with gradient background, company branding,
/// and active branch indicator.
class DrawerHeader extends StatelessWidget {
  final String? companyName;
  final String? logoUrl;
  final bool isLoading;

  const DrawerHeader({
    super.key,
    this.companyName,
    this.logoUrl,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final fullLogoUrl = UrlUtils.getFullImageUrl(logoUrl);

    return Container(
      padding: const EdgeInsets.fromLTRB(AppSizes.xl, AppSizes.xxl, AppSizes.xl, AppSizes.xl),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            BrandColors.primaryContainer.withValues(alpha: 0.3),
            BrandColors.surface,
          ],
        ),
        image: fullLogoUrl != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(fullLogoUrl),
                fit: BoxFit.cover,
                opacity: 1.0,
              )
            : null,
      ),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: _CompanyAvatar(
            companyName: companyName,
            logoUrl: logoUrl,
            isLoading: isLoading,
          ),
        ),
      ),
    );
  }
}

class _CompanyAvatar extends StatelessWidget {
  final String? companyName;
  final String? logoUrl;
  final bool isLoading;

  const _CompanyAvatar({
    this.companyName,
    this.logoUrl,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {

    final fullLogoUrl = UrlUtils.getFullImageUrl(logoUrl);

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: fullLogoUrl == null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  BrandColors.primary,
                  BrandColors.primary.withValues(alpha: 0.7),
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: BrandColors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        image: fullLogoUrl != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(fullLogoUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
width: AppSizes.iconSizeLg,
                  height: AppSizes.iconSizeLg,
                child: CircularProgressIndicator(
                  strokeWidth: AppSizes.loaderStrokeWidth,
                  valueColor: AlwaysStoppedAnimation<Color>(BrandColors.textLight),
                ),
              )
            : (fullLogoUrl == null)
                ? (companyName != null && companyName!.isNotEmpty)
                    ? Text(
                        companyName![0].toUpperCase(),
                        style: context.title(
                          color: BrandColors.textLight,
                          bold: true,
                        ),
                      )
                    : Icon(
                        Icons.business_rounded,
                        color: BrandColors.textLight,
                        size: AppSizes.iconSizeLg,
                      )
                : const SizedBox.shrink(),
      ),
    );
  }
}

class _ShimmerBox extends StatefulWidget {
  final double width;
  final double height;

  const _ShimmerBox({required this.width, required this.height});

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
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
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusDialog),
            gradient: LinearGradient(
              begin: Alignment(_animation.value - 1, 0),
              end: Alignment(_animation.value + 1, 0),
              colors: [
                BrandColors.surfaceContainerHighest,
                BrandColors.surfaceContainerHighest.withValues(alpha: 0.5),
                BrandColors.surfaceContainerHighest,
              ],
            ),
          ),
        );
      },
    );
  }
}


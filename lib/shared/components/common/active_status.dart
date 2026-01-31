
import 'package:cyber_pos/app/theme/brand_colors.dart';
import 'package:cyber_pos/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_sizes.dart';

class ActiveStatus extends StatelessWidget {
  final bool isActive;
  const ActiveStatus({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive 
                ? BrandColors.success
                : BrandColors.error,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          ' ${isActive ? 'Active' : 'Inactive'}',
          style: context.label(
            color: isActive ? BrandColors.success : BrandColors.error,
            bold: false,
          ),
        ),
      ],
    );
  }
}

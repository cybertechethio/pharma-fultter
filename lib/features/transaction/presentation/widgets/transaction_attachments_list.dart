import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/local_file_image_preview.dart';
import '../providers/form/transaction_form_notifier.dart';

class TransactionAttachmentsList extends ConsumerWidget {
  const TransactionAttachmentsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    final attachments = formState.receiptFilePaths;

    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments (${attachments.length})',
          style: context.subtitle(),
        ),
        SizedBox(height: AppSizes.md),
        SizedBox(
          height: AppSizes.attachmentThumbSize,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: attachments.length,
            itemBuilder: (context, index) {
              final filePath = attachments[index];
              return Container(
                width: AppSizes.attachmentThumbSize,
                height: AppSizes.attachmentThumbSize,
                margin: EdgeInsets.only(right: AppSizes.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                  border: Border.all(color: BrandColors.divider),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => LocalFileImagePreview.show(
                        context: context,
                        filePath: filePath,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radius),
                        child: Image.file(
                          File(filePath),
                          fit: BoxFit.cover,
                          width: AppSizes.attachmentThumbSize,
                          height: AppSizes.attachmentThumbSize,
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppSizes.xs,
                      right: AppSizes.xs,
                      child: CircleAvatar(
                        radius: AppSizes.sm,
                        backgroundColor: BrandColors.error,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: AppSizes.iconSizeSm,
                          icon: const Icon(Icons.close, color: BrandColors.textLight),
                          onPressed: () => formNotifier.removeReceipt(filePath),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


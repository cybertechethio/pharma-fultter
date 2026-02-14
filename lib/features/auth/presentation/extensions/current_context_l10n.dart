import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../domain/entities/current_context.dart';

/// Extension to get localized display text for [CurrentContext].
/// Use this in UI instead of [CurrentContext.contextDisplayText].
extension CurrentContextL10n on CurrentContext {
  String localizedDisplayText(AppLocalizations l10n) {
    if (hasCompleteContext) return l10n.companyAndBranchSelected;
    if (hasCompany) return l10n.companySelected;
    if (hasBranch) return l10n.branchSelected;
    return l10n.noContextSelected;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/company.dart';
import '../../data/models/company_request_model.dart';
import '../../../../features/auth/presentation/providers/current_context_provider.dart';
import 'company_providers.dart';
import 'company_events.dart';
import 'company_loading_providers.dart';

part 'company_notifier.g.dart';

@Riverpod(keepAlive: false)
class CompanyNotifier extends _$CompanyNotifier {
  @override
  Future<Company?> build() async {
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> updateCompany({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath,
  }) async {
    final updating = ref.read(companyUpdateLoadingProvider.notifier);
    updating.setLoading(true);

    final useCase = ref.read(updateCompanyUseCaseProvider);
    final result = await useCase.call(
      companyId: companyId,
      request: request,
      logoFilePath: logoFilePath,
    );

    result.fold(
      (failure) {
        ref.read(companyUiEventsProvider.notifier).emit(CompanyFailure(failure));
      },
      (updated) {
        // Update state with new company data
        state = AsyncValue.data(updated);
        
        ref.read(companyUiEventsProvider.notifier).emit(
          CompanyUpdated(updated, ''),
        );
      },
    );

    updating.setLoading(false);
  }

  Future<Company?> _load() async {
    // Get company ID from current context
    final context = await ref.read(currentContextProvider.future);
    
    // Since company ID must exist and we can't have a default,
    // we use a null check and throw if it's missing.
    if (context?.currentCompanyId == null) {
      throw const Failure.unexpectedError('Company ID not found in current context');
    }
    
    final companyId = context!.currentCompanyId!;

    final useCase = ref.read(getCompanyUseCaseProvider);
    final result = await useCase.call(companyId: companyId);
    
    return result.fold(
      (failure) {
        throw failure;
      },
      (company) => company,
    );
  }
}


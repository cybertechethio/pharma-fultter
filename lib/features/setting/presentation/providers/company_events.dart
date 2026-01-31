import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/company.dart';
import '../../../../core/errors/failure.dart';

part 'company_events.g.dart';

sealed class CompanyUiEvent {}

class CompanyUpdated extends CompanyUiEvent {
  final Company entity;
  final String message;
  CompanyUpdated(this.entity, this.message);
}

class CompanyFailure extends CompanyUiEvent {
  final Failure failure;
  CompanyFailure(this.failure);
}

@Riverpod(keepAlive: true)
class CompanyUiEvents extends _$CompanyUiEvents {
  @override
  CompanyUiEvent? build() {
    return null;
  }

  void emit(CompanyUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}


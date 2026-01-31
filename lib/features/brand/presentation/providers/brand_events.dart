import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/brand.dart';
import '../../../../core/errors/failure.dart';

part 'brand_events.g.dart';

sealed class BrandUiEvent {}

class BrandCreated extends BrandUiEvent {
  final BrandEntity entity;
  final String message;
  BrandCreated(this.entity, this.message);
}

class BrandUpdated extends BrandUiEvent {
  final BrandEntity entity;
  final String message;
  BrandUpdated(this.entity, this.message);
}

class BrandDeleted extends BrandUiEvent {
  final String id;
  final String message;
  BrandDeleted(this.id, this.message);
}

class BrandFailure extends BrandUiEvent {
  final Failure failure;
  BrandFailure(this.failure);
}

@riverpod
class BrandUiEvents extends _$BrandUiEvents {
  @override
  BrandUiEvent? build() {
    return null;
  }

  void emit(BrandUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}


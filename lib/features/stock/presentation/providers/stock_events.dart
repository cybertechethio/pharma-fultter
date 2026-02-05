import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/stock.dart';
import '../../../../core/errors/failure.dart';

part 'stock_events.g.dart';

sealed class StockUiEvent {}

class StockUpdated extends StockUiEvent {
  final Stock entity;
  final String message;
  StockUpdated(this.entity, this.message);
}

class StockFailure extends StockUiEvent {
  final Failure failure;
  StockFailure(this.failure);
}

@riverpod
class StockUiEvents extends _$StockUiEvents {
  @override
  StockUiEvent? build() {
    return null;
  }

  void emit(StockUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}


import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/item_api_service.dart';
import '../../data/datasources/item_remote_data_source.dart';
import '../../data/datasources/item_remote_data_source_impl.dart';
import '../../data/repositories/item_repository_impl.dart';
import '../../domain/repositories/item_repository.dart';
import '../../domain/usecases/get_items_usecase.dart';
import '../../domain/usecases/create_item_usecase.dart';
import '../../domain/usecases/update_item_usecase.dart';
import '../../domain/usecases/delete_item_usecase.dart';

part 'item_providers.g.dart';

@riverpod
ItemApiService itemApiService(Ref ref) {
  return const ItemApiService();
}

@riverpod
ItemRemoteDataSource itemRemoteDataSource(Ref ref) {
  return ItemRemoteDataSourceImpl(
    ref.watch(itemApiServiceProvider),
  );
}

@riverpod
ItemRepository itemRepository(Ref ref) {
  return ItemRepositoryImpl(
    ref.watch(itemRemoteDataSourceProvider),
  );
}

@riverpod
GetItemsUseCase getItemsUseCase(Ref ref) {
  return GetItemsUseCase(
    ref.watch(itemRepositoryProvider),
  );
}

@riverpod
CreateItemUseCase createItemUseCase(Ref ref) {
  return CreateItemUseCase(
    ref.watch(itemRepositoryProvider),
  );
}

@riverpod
UpdateItemUseCase updateItemUseCase(Ref ref) {
  return UpdateItemUseCase(
    ref.watch(itemRepositoryProvider),
  );
}

@riverpod
DeleteItemUseCase deleteItemUseCase(Ref ref) {
  return DeleteItemUseCase(
    ref.watch(itemRepositoryProvider),
  );
}


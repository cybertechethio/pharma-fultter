import '../../../../core/enums/stock_status_enum.dart';
import '../../domain/entities/stock.dart';
import '../../domain/entities/stock_item.dart';
import '../models/stock_model.dart';
import '../models/stock_item_model.dart';

/// Extension for mapping StockItemModel to StockItem entity
extension StockItemModelMapper on StockItemModel {
  StockItem toDomain() {
    return StockItem(
      id: id,
      name: name,
      code: code,
      categories: categories,
      subCategories: subCategories,
      brands: brands,
      units: units,
      models: models,
      color: color,
      size: size,
      material: material,
      weight: weight,
      unitPrice: unitPrice,
    );
  }
}

/// Extension for mapping StockModel to Stock entity
extension StockModelMapper on StockModel {
  Stock toDomain() {
    return Stock(
      id: id,
      companyId: companyId,
      branchId: branchId,
      itemId: itemId,
      totalQuantity: totalQuantity,
      lowStockThreshold: lowStockThreshold,
      lowStockStatus: StockStatusExtension.fromString(lowStockStatus),
      location: location,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      item: item?.toDomain(),
    );
  }
}


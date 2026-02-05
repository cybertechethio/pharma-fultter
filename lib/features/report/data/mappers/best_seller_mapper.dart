import '../../domain/entities/bestsellerreport/best_seller.dart';
import '../models/bestsellerreport/best_seller_model.dart';

// BestSeller Mapper
extension BestSellerMapper on BestSellerModel {
  BestSeller toDomain() {
    return BestSeller(
      id: id,
      itemId: itemId,
      itemName: itemName,
      itemCode: itemCode,
      sku: sku,
      category: category,
      brand: brand,
      imageUrl: imageUrl,
      soldQty: soldQty,
      soldAmount: soldAmount,
      instockQty: instockQty,
    );
  }
}


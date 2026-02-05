import '../../domain/entities/company.dart';
import '../models/company_model.dart';

extension CompanyMapper on CompanyModel {
  Company toDomain() {
    return Company(
      id: id,
      name: name,
      phone1: phone1,
      phone2: phone2,
      logoUrl: logoUrl,
      tinNumber: tinNumber,
      tradeName: tradeName,
      city: city,
      wereda: wereda,
      autoPrint: autoPrint,
      defaultStartDate: defaultStartDate,
      businessType: businessType,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}


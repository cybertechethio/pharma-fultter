import 'package:cyber_pos/features/setting/domain/entities/company.dart';
import '../schemas/company_schema.dart';

extension CompanySchemaMapper on CompanySchema {
  Company toDomain() => Company(
    id: companyId,
    name: name,
    phone1: phone1,
    phone2: phone2,
    logoUrl: logoUrl,
    tinNumber: tinNumber,
    tradeName: tradeName,
    city: city,
    wereda: wereda,
    autoPrint: autoPrint ?? false,
    defaultStartDate: defaultStartDate,
    businessType: businessType,
    createdAt: createdAt,
    updatedAt: updatedAt ?? createdAt, // Fallback to createdAt if updatedAt is null
  );
}

extension CompanyToSchemaMapper on Company {
  CompanySchema toSchema() => CompanySchema()
    ..companyId = id
    ..name = name
    ..phone1 = phone1
    ..phone2 = phone2
    ..logoUrl = logoUrl
    ..tinNumber = tinNumber
    ..tradeName = tradeName
    ..city = city
    ..wereda = wereda
    ..autoPrint = autoPrint
    ..defaultStartDate = defaultStartDate
    ..businessType = businessType
    ..createdAt = createdAt
    ..updatedAt = updatedAt;
}


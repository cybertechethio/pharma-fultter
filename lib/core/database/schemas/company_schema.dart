import 'package:isar_community/isar.dart';

part 'company_schema.g.dart';

@collection
class CompanySchema {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String companyId; // Company ID from API
  
  late String name;
  String? phone1;
  String? phone2;
  String? logoUrl;
  String? tinNumber;
  String? tradeName;
  String? city;
  String? wereda;
  bool? autoPrint;
  DateTime? defaultStartDate;
  String? defaultCalendarType;
  late DateTime createdAt;
  DateTime? updatedAt;
}


import 'package:isar_community/isar.dart';

part 'branch_schema.g.dart';

@collection
class BranchSchema {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String branchId; // Branch ID from API
  
  late String name;
  late String companyId;
  late bool isActive;
  DateTime? createdAt;
  String? createdBy;
  String? updatedBy;
  
  @Index()
  String get companyIdIndex => companyId; // Index for filtering by company
}


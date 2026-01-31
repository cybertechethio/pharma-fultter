import 'package:isar_community/isar.dart';

part 'current_context_schema.g.dart';

@collection
class CurrentContextSchema {
  Id id = Isar.autoIncrement;
  
  String? currentCompanyId;
  String? currentBranchId;
  
  // Store only one current context - use a constant singleton key
  @Index(unique: true)
  int singleton = 1;
}


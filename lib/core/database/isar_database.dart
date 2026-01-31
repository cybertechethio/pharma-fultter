import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../services/logging_service.dart';
import 'schemas/user_schema.dart';
import 'schemas/current_context_schema.dart';
import 'schemas/company_schema.dart';
import 'schemas/branch_schema.dart';

class IsarDatabase {
  static Isar? _isar;
  
  static Future<Isar> get instance async {
    if (_isar != null) {
      return _isar!;
    }
    
    return await _init();
  }
  
  static Future<Isar> _init() async {
    try {
      LoggingService.database('Initializing Isar database');
      
      final dir = await getApplicationDocumentsDirectory();
      final dbPath = path.join(dir.path, 'cyber_pos.isar');
      
      _isar = await Isar.open(
        [
          UserSchemaSchema,
          CurrentContextSchemaSchema,
          CompanySchemaSchema,
          BranchSchemaSchema,
        ],
        directory: dir.path,
        name: 'cyber_pos',
      );
      
      LoggingService.database('Isar database initialized successfully', {
        'path': dbPath,
      });
      
      return _isar!;
    } catch (e, stackTrace) {
      LoggingService.error('Failed to initialize Isar database', e, stackTrace);
      rethrow;
    }
  }
  
  static Future<void> close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
      LoggingService.database('Isar database closed');
    }
  }
  
  static Future<void> clearAll() async {
    try {
      final isar = await instance;
      await isar.writeTxn(() async {
        await isar.userSchemas.clear();
        await isar.currentContextSchemas.clear();
        await isar.companySchemas.clear();
        await isar.branchSchemas.clear();
      });
      LoggingService.database('Isar database cleared successfully');
    } catch (e, stackTrace) {
      LoggingService.error('Failed to clear Isar database', e, stackTrace);
      rethrow;
    }
  }
}


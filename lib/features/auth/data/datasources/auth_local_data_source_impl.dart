import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar_community/isar.dart';
import '../../../../core/database/schemas/user_schema.dart';
import '../../../../core/database/schemas/current_context_schema.dart';
import '../../../../core/database/schemas/company_schema.dart';
import '../../../../core/database/schemas/branch_schema.dart';
import '../../../../core/database/mappers/user_schema_mapper.dart';
import '../../../../core/database/mappers/current_context_schema_mapper.dart';
import '../../../../core/database/mappers/company_schema_mapper.dart';
import '../../../../core/database/mappers/branch_schema_mapper.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/current_context.dart';
import '../../../setting/domain/entities/company.dart';
import '../../../branch/domain/entities/branch.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;
  final Isar _isar;

  AuthLocalDataSourceImpl(this._storage, this._isar);

  // Token storage keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  @override
  Future<void> saveTokens(AuthToken tokens) async {
    try {
      LoggingService.database('Saving tokens to secure storage');
      
      await _storage.write(key: _accessTokenKey, value: tokens.accessToken);
      await _storage.write(key: _refreshTokenKey, value: tokens.refreshToken);
      
      LoggingService.database('Tokens saved successfully');
    } catch (e) {
      LoggingService.error('Failed to save tokens', e, StackTrace.current);
      throw Failure.storageError('Failed to save tokens: ${e.toString()}');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      LoggingService.database('Retrieving access token from secure storage');
      
      final token = await _storage.read(key: _accessTokenKey);
      
      if (token != null) {
        LoggingService.database('Access token retrieved successfully');
      } else {
        LoggingService.database('No access token found');
      }
      
      return token;
    } catch (e) {
      LoggingService.error('Failed to get access token', e, StackTrace.current);
      throw Failure.storageError('Failed to get access token: ${e.toString()}');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      LoggingService.database('Retrieving refresh token from secure storage');
      
      final token = await _storage.read(key: _refreshTokenKey);
      
      if (token != null) {
        LoggingService.database('Refresh token retrieved successfully');
      } else {
        LoggingService.database('No refresh token found');
      }
      
      return token;
    } catch (e) {
      LoggingService.error('Failed to get refresh token', e, StackTrace.current);
      throw Failure.storageError('Failed to get refresh token: ${e.toString()}');
    }
  }

  @override
  Future<void> clearTokens() async {
    try {
      LoggingService.database('Clearing tokens from secure storage');
      
      await _storage.delete(key: _accessTokenKey);
      await _storage.delete(key: _refreshTokenKey);
      
      LoggingService.database('Tokens cleared successfully');
    } catch (e) {
      LoggingService.error('Failed to clear tokens', e, StackTrace.current);
      throw Failure.storageError('Failed to clear tokens: ${e.toString()}');
    }
  }

  @override
  Future<User?> getUser() async {
    try {
      LoggingService.database('Retrieving user data from Isar');
      
      final userSchema = await _isar.userSchemas.where().findFirst();
      
      if (userSchema != null) {
        final user = userSchema.toDomain();
        
        LoggingService.database('User data retrieved successfully', {
          'userId': user.id,
          'email': user.email,
        });
        
        return user;
      } else {
        LoggingService.database('No user data found');
        return null;
      }
    } catch (e) {
      LoggingService.error('Failed to get user data', e, StackTrace.current);
      throw Failure.storageError('Failed to get user data: ${e.toString()}');
    }
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      LoggingService.database('Saving user data to Isar', {
        'userId': user.id,
        'email': user.email,
      });
      
      await _isar.writeTxn(() async {
        // Clear existing user data first
        await _isar.userSchemas.clear();
        
        // Save new user data
        final userSchema = user.toSchema();
        await _isar.userSchemas.put(userSchema);
      });
      
      LoggingService.database('User data saved successfully');
    } catch (e) {
      LoggingService.error('Failed to save user data', e, StackTrace.current);
      throw Failure.storageError('Failed to save user data: ${e.toString()}');
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      LoggingService.database('Clearing user data from Isar');
      
      await _isar.writeTxn(() async {
        await _isar.userSchemas.clear();
      });
      
      LoggingService.database('User data cleared successfully');
    } catch (e) {
      LoggingService.error('Failed to clear user data', e, StackTrace.current);
      throw Failure.storageError('Failed to clear user data: ${e.toString()}');
    }
  }

  @override
  Future<void> saveCurrentContext(CurrentContext currentContext) async {
    try {
      LoggingService.database('Saving current context to Isar', {
        'currentCompanyId': currentContext.currentCompanyId,
        'currentBranchId': currentContext.currentBranchId,
      });
      
      await _isar.writeTxn(() async {
        // Clear existing context first
        await _isar.currentContextSchemas.clear();
        
        // Save new context
        final contextSchema = currentContext.toSchema();
        await _isar.currentContextSchemas.put(contextSchema);
      });
      
      LoggingService.database('Current context saved successfully');
    } catch (e) {
      LoggingService.error('Failed to save current context', e, StackTrace.current);
      throw Failure.storageError('Failed to save current context: ${e.toString()}');
    }
  }

  @override
  Future<CurrentContext?> getCurrentContext() async {
    try {
      LoggingService.database('Retrieving current context from Isar');
      
      final contextSchema = await _isar.currentContextSchemas
          .filter()
          .singletonEqualTo(1)
          .findFirst();
      
      if (contextSchema != null) {
        final context = contextSchema.toDomain();
        
        LoggingService.database('Current context retrieved successfully', {
          'currentCompanyId': context.currentCompanyId,
          'currentBranchId': context.currentBranchId,
        });
        
        return context;
      } else {
        LoggingService.database('No current context found');
        return null;
      }
    } catch (e) {
      LoggingService.error('Failed to get current context', e, StackTrace.current);
      throw Failure.storageError('Failed to get current context: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCurrentContext() async {
    try {
      LoggingService.database('Clearing current context from Isar');
      
      await _isar.writeTxn(() async {
        await _isar.currentContextSchemas.clear();
      });
      
      LoggingService.database('Current context cleared successfully');
    } catch (e) {
      LoggingService.error('Failed to clear current context', e, StackTrace.current);
      throw Failure.storageError('Failed to clear current context: ${e.toString()}');
    }
  }

  @override
  Future<void> saveCompany(Company company) async {
    try {
      LoggingService.database('Saving company to Isar', {
        'companyId': company.id,
        'name': company.name,
      });
      
      await _isar.writeTxn(() async {
        // Clear existing company first
        await _isar.companySchemas.clear();
        
        // Save new company
        final companySchema = company.toSchema();
        await _isar.companySchemas.put(companySchema);
      });
      
      LoggingService.database('Company saved successfully');
    } catch (e) {
      LoggingService.error('Failed to save company', e, StackTrace.current);
      throw Failure.storageError('Failed to save company: ${e.toString()}');
    }
  }

  @override
  Future<Company?> getCompany() async {
    try {
      LoggingService.database('Retrieving company from Isar');
      
      final companySchema = await _isar.companySchemas.where().findFirst();
      
      if (companySchema != null) {
        final company = companySchema.toDomain();
      
        LoggingService.database('Company retrieved successfully', {
          'companyId': company.id,
          'name': company.name,
        });
        
        return company;
      } else {
        LoggingService.database('No company found');
        return null;
      }
    } catch (e) {
      LoggingService.error('Failed to get company', e, StackTrace.current);
      throw Failure.storageError('Failed to get company: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCompany() async {
    try {
      LoggingService.database('Clearing company from Isar');
      
      await _isar.writeTxn(() async {
        await _isar.companySchemas.clear();
      });
      
      LoggingService.database('Company cleared successfully');
    } catch (e) {
      LoggingService.error('Failed to clear company', e, StackTrace.current);
      throw Failure.storageError('Failed to clear company: ${e.toString()}');
    }
  }

  @override
  Future<void> saveBranches(List<Branch> branches) async {
    try {
      LoggingService.database('Saving branches to Isar', {
        'count': branches.length,
      });
      
      await _isar.writeTxn(() async {
        // Clear existing branches first
        await _isar.branchSchemas.clear();
        
        // Save new branches
        final branchSchemas = branches.map((b) => b.toSchema()).toList();
        await _isar.branchSchemas.putAll(branchSchemas);
      });
      
      LoggingService.database('Branches saved successfully', {
        'count': branches.length,
      });
    } catch (e) {
      LoggingService.error('Failed to save branches', e, StackTrace.current);
      throw Failure.storageError('Failed to save branches: ${e.toString()}');
    }
  }

  @override
  Future<List<Branch>> getBranches() async {
    try {
      LoggingService.database('Retrieving branches from Isar');
      
      final branchSchemas = await _isar.branchSchemas.where().findAll();
      
      if (branchSchemas.isEmpty) {
        LoggingService.database('No branches found');
        return [];
      }
      
      final branches = branchSchemas.map((schema) => schema.toDomain()).toList();
      
      LoggingService.database('Branches retrieved successfully', {
        'count': branches.length,
      });
      
      return branches;
    } catch (e) {
      LoggingService.error('Failed to get branches', e, StackTrace.current);
      throw Failure.storageError('Failed to get branches: ${e.toString()}');
    }
  }

  @override
  Future<void> clearBranches() async {
    try {
      LoggingService.database('Clearing branches from Isar');
      
      await _isar.writeTxn(() async {
        await _isar.branchSchemas.clear();
      });
      
      LoggingService.database('Branches cleared successfully');
    } catch (e) {
      LoggingService.error('Failed to clear branches', e, StackTrace.current);
      throw Failure.storageError('Failed to clear branches: ${e.toString()}');
    }
  }
}

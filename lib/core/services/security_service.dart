// import 'dart:convert';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:crypto/crypto.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:local_auth/local_auth.dart';
// import '../errors/app_exception.dart';
// import '../errors/exceptions.dart';

// /// Comprehensive security service for the application
// /// 
// /// Provides:
// /// - Secure storage for sensitive data
// /// - Biometric authentication
// /// - Data encryption/decryption
// /// - Secure key generation
// class SecurityService {
//   static final SecurityService _instance = SecurityService._internal();
//   factory SecurityService() => _instance;
//   SecurityService._internal();

//   final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
//     aOptions: AndroidOptions(
//       encryptedSharedPreferences: true,
//     ),
//     iOptions: IOSOptions(
//       accessibility: KeychainAccessibility.first_unlock_this_device,
//     ),
//   );

//   final LocalAuthentication _localAuth = LocalAuthentication();

//   /// Store sensitive data securely
//   Future<void> storeSecureData(String key, String value) async {
//     try {
//       await _secureStorage.write(key: key, value: value);
//     } catch (e) {
//       throw StorageException(
//         'Failed to store secure data: $e',
//         type: StorageErrorType.writeError,
//         originalError: e,
//       );
//     }
//   }

//   /// Retrieve sensitive data securely
//   Future<String?> getSecureData(String key) async {
//     try {
//       return await _secureStorage.read(key: key);
//     } catch (e) {
//       throw StorageException(
//         'Failed to retrieve secure data: $e',
//         type: StorageErrorType.readError,
//         originalError: e,
//       );
//     }
//   }

//   /// Delete sensitive data
//   Future<void> deleteSecureData(String key) async {
//     try {
//       await _secureStorage.delete(key: key);
//     } catch (e) {
//       throw StorageException(
//         'Failed to delete secure data: $e',
//         type: StorageErrorType.deleteError,
//         originalError: e,
//       );
//     }
//   }

//   /// Delete all secure data
//   Future<void> deleteAllSecureData() async {
//     try {
//       await _secureStorage.deleteAll();
//     } catch (e) {
//       throw StorageException(
//         'Failed to delete all secure data: $e',
//         type: StorageErrorType.deleteError,
//         originalError: e,
//       );
//     }
//   }

//   /// Check if biometric authentication is available
//   Future<bool> isBiometricAvailable() async {
//     try {
//       final isAvailable = await _localAuth.canCheckBiometrics;
//       final isDeviceSupported = await _localAuth.isDeviceSupported();
//       return isAvailable && isDeviceSupported;
//     } catch (e) {
//       return false;
//     }
//   }

//   /// Get available biometric types
//   Future<List<BiometricType>> getAvailableBiometrics() async {
//     try {
//       return await _localAuth.getAvailableBiometrics();
//     } catch (e) {
//       return [];
//     }
//   }

//   /// Authenticate using biometrics
//   Future<bool> authenticateWithBiometrics({
//     String? localizedReason,
//     bool useErrorDialogs = true,
//     bool stickyAuth = true,
//   }) async {
//     try {
//       final isAvailable = await isBiometricAvailable();
//       if (!isAvailable) {
//         throw PermissionException(
//           'Biometric authentication not available',
//           type: PermissionErrorType.restricted,
//         );
//       }

//       final result = await _localAuth.authenticate(
//         localizedReason: localizedReason ?? 'Authenticate to continue',
//       );

//       return result;
//     } catch (e) {
//       if (e is PermissionException) {
//         rethrow;
//       }
//       throw PermissionException(
//         'Biometric authentication failed: $e',
//         type: PermissionErrorType.denied,
//         originalError: e,
//       );
//     }
//   }

//   /// Generate secure random key
//   String generateSecureKey({int length = 32}) {
//     const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//     final random = Random.secure();
//     return String.fromCharCodes(
//       Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
//     );
//   }

//   /// Generate secure random bytes
//   Uint8List generateSecureBytes(int length) {
//     final random = Random.secure();
//     final bytes = Uint8List(length);
//     for (int i = 0; i < length; i++) {
//       bytes[i] = random.nextInt(256);
//     }
//     return bytes;
//   }

//   /// Hash data using SHA-256
//   String hashData(String data) {
//     final bytes = utf8.encode(data);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }

//   /// Hash data with salt
//   String hashDataWithSalt(String data, String salt) {
//     return hashData(data + salt);
//   }

//   /// Generate salt for hashing
//   String generateSalt({int length = 16}) {
//     return generateSecureKey(length: length);
//   }

//   /// Simple encryption (for non-critical data)
//   String encryptData(String data, String key) {
//     try {
//       final keyBytes = utf8.encode(key);
//       final dataBytes = utf8.encode(data);
      
//       final encrypted = <int>[];
//       for (int i = 0; i < dataBytes.length; i++) {
//         encrypted.add(dataBytes[i] ^ keyBytes[i % keyBytes.length]);
//       }
      
//       return base64.encode(encrypted);
//     } catch (e) {
//       throw StorageException(
//         'Failed to encrypt data: $e',
//         type: StorageErrorType.writeError,
//         originalError: e,
//       );
//     }
//   }

//   /// Simple decryption (for non-critical data)
//   String decryptData(String encryptedData, String key) {
//     try {
//       final keyBytes = utf8.encode(key);
//       final encryptedBytes = base64.decode(encryptedData);
      
//       final decrypted = <int>[];
//       for (int i = 0; i < encryptedBytes.length; i++) {
//         decrypted.add(encryptedBytes[i] ^ keyBytes[i % keyBytes.length]);
//       }
      
//       return utf8.decode(decrypted);
//     } catch (e) {
//       throw StorageException(
//         'Failed to decrypt data: $e',
//         type: StorageErrorType.readError,
//         originalError: e,
//       );
//     }
//   }

//   /// Store encrypted data
//   Future<void> storeEncryptedData(String key, String data, String encryptionKey) async {
//     final encryptedData = encryptData(data, encryptionKey);
//     await storeSecureData(key, encryptedData);
//   }

//   /// Retrieve and decrypt data
//   Future<String?> getDecryptedData(String key, String encryptionKey) async {
//     final encryptedData = await getSecureData(key);
//     if (encryptedData == null) return null;
    
//     return decryptData(encryptedData, encryptionKey);
//   }

//   /// Validate password strength
//   PasswordStrength validatePasswordStrength(String password) {
//     int score = 0;
//     final issues = <String>[];

//     // Length check
//     if (password.length >= 8) {
//       score += 1;
//     } else {
//       issues.add('Password must be at least 8 characters long');
//     }

//     // Uppercase check
//     if (password.contains(RegExp(r'[A-Z]'))) {
//       score += 1;
//     } else {
//       issues.add('Password must contain at least one uppercase letter');
//     }

//     // Lowercase check
//     if (password.contains(RegExp(r'[a-z]'))) {
//       score += 1;
//     } else {
//       issues.add('Password must contain at least one lowercase letter');
//     }

//     // Number check
//     if (password.contains(RegExp(r'[0-9]'))) {
//       score += 1;
//     } else {
//       issues.add('Password must contain at least one number');
//     }

//     // Special character check
//     if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
//       score += 1;
//     } else {
//       issues.add('Password must contain at least one special character');
//     }

//     // Determine strength
//     PasswordStrengthLevel level;
//     if (score < 2) {
//       level = PasswordStrengthLevel.weak;
//     } else if (score < 4) {
//       level = PasswordStrengthLevel.medium;
//     } else {
//       level = PasswordStrengthLevel.strong;
//     }

//     return PasswordStrength(
//       level: level,
//       score: score,
//       maxScore: 5,
//       issues: issues,
//     );
//   }

//   /// Check if device is secure (has screen lock)
//   Future<bool> isDeviceSecure() async {
//     try {
//       return await _localAuth.isDeviceSupported();
//     } catch (e) {
//       return false;
//     }
//   }

//   /// Get device security status
//   Future<DeviceSecurityStatus> getDeviceSecurityStatus() async {
//     try {
//       final isSupported = await _localAuth.isDeviceSupported();
//       final canCheckBiometrics = await _localAuth.canCheckBiometrics;
//       final availableBiometrics = await getAvailableBiometrics();

//       return DeviceSecurityStatus(
//         isDeviceSupported: isSupported,
//         canCheckBiometrics: canCheckBiometrics,
//         availableBiometrics: availableBiometrics,
//         hasFingerprint: availableBiometrics.contains(BiometricType.fingerprint),
//         hasFaceId: availableBiometrics.contains(BiometricType.face),
//         hasIris: availableBiometrics.contains(BiometricType.iris),
//       );
//     } catch (e) {
//       return DeviceSecurityStatus(
//         isDeviceSupported: false,
//         canCheckBiometrics: false,
//         availableBiometrics: [],
//         hasFingerprint: false,
//         hasFaceId: false,
//         hasIris: false,
//       );
//     }
//   }
// }

// /// Password strength validation result
// class PasswordStrength {
//   final PasswordStrengthLevel level;
//   final int score;
//   final int maxScore;
//   final List<String> issues;

//   const PasswordStrength({
//     required this.level,
//     required this.score,
//     required this.maxScore,
//     required this.issues,
//   });

//   bool get isStrong => level == PasswordStrengthLevel.strong;
//   bool get isMedium => level == PasswordStrengthLevel.medium;
//   bool get isWeak => level == PasswordStrengthLevel.weak;
// }

// /// Password strength levels
// enum PasswordStrengthLevel {
//   weak,
//   medium,
//   strong,
// }

// /// Device security status
// class DeviceSecurityStatus {
//   final bool isDeviceSupported;
//   final bool canCheckBiometrics;
//   final List<BiometricType> availableBiometrics;
//   final bool hasFingerprint;
//   final bool hasFaceId;
//   final bool hasIris;

//   const DeviceSecurityStatus({
//     required this.isDeviceSupported,
//     required this.canCheckBiometrics,
//     required this.availableBiometrics,
//     required this.hasFingerprint,
//     required this.hasFaceId,
//     required this.hasIris,
//   });

//   bool get hasAnyBiometric => hasFingerprint || hasFaceId || hasIris;
// }

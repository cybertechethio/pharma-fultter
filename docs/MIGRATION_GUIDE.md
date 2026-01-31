# Migration Guide: Converting Existing Models to Freezed

## Overview

This guide provides step-by-step instructions for migrating your existing models to use Freezed. We'll start with the most commonly used models and work through them systematically.

## Models to Migrate

Based on the analysis of your codebase, here are the models that would benefit most from Freezed migration:

### Priority 1 (High Impact)
1. **AudioRecording** - Complex model with many fields
2. **AudioFileInfo** - Large model with extensive functionality
3. **AudioSettings** - Configuration model with many options
4. **LoginResponseModel** - API response model
5. **RegistrationResponseModel** - API response model

### Priority 2 (Medium Impact)
6. **ResetPasswordResponseModel** - API response model
7. **ApiException** - Error handling model

## Migration Process

### Step 1: AudioRecording Model

**Current Location**: `lib/audio/models/audio_recording.dart`
**Current Lines**: ~79 lines
**Estimated Reduction**: ~50 lines

#### Before (Current Implementation)
```dart
class AudioRecording {
  final String id;
  final String filePath;
  final String fileName;
  final Duration duration;
  final int fileSize;
  final AudioQuality quality;
  final AudioFormat format;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final Map<String, dynamic> metadata;

  const AudioRecording({
    required this.id,
    required this.filePath,
    required this.fileName,
    required this.duration,
    required this.fileSize,
    required this.quality,
    required this.format,
    required this.createdAt,
    required this.modifiedAt,
    this.metadata = const {},
  });

  // Manual copyWith, fromJson, toJson, ==, hashCode implementations...
}
```

#### After (Freezed Implementation)
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_recording.freezed.dart';
part 'audio_recording.g.dart';

@freezed
class AudioRecording with _$AudioRecording {
  const factory AudioRecording({
    required String id,
    required String filePath,
    required String fileName,
    required Duration duration,
    required int fileSize,
    required AudioQuality quality,
    required AudioFormat format,
    required DateTime createdAt,
    required DateTime modifiedAt,
    @Default({}) Map<String, dynamic> metadata,
  }) = _AudioRecording;

  factory AudioRecording.fromJson(Map<String, dynamic> json) =>
      _$AudioRecordingFromJson(json);
}

extension AudioRecordingX on AudioRecording {
  File get file => File(filePath);
  bool get exists => file.existsSync();
  
  String get formattedFileSize {
    if (fileSize < 1024) return '$fileSize B';
    if (fileSize < 1024 * 1024) return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    if (fileSize < 1024 * 1024 * 1024) return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(fileSize / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
```

### Step 2: AudioFileInfo Model

**Current Location**: `lib/audio/models/audio_file_info.dart`
**Current Lines**: ~248 lines
**Estimated Reduction**: ~150 lines

#### Migration Steps
1. Create `audio_file_info_freezed.dart`
2. Add Freezed annotations
3. Move business logic to extensions
4. Update imports in dependent files
5. Test functionality

### Step 3: AudioSettings Model

**Current Location**: `lib/audio/models/audio_settings.dart`
**Current Lines**: ~210 lines
**Estimated Reduction**: ~120 lines

#### Key Benefits
- Automatic equality and hashCode
- Type-safe copyWith
- JSON serialization for settings persistence

### Step 4: API Response Models

#### LoginResponseModel
**Current Location**: `lib/features/auth/data/models/login_response_model.dart`
**Current Lines**: ~54 lines
**Estimated Reduction**: ~30 lines

#### RegistrationResponseModel
**Current Location**: `lib/features/auth/data/models/registration_response_model.dart`
**Current Lines**: Similar to LoginResponseModel

## Migration Checklist

### For Each Model

- [ ] **Create Freezed Version**
  - [ ] Create new file with `_freezed.dart` suffix
  - [ ] Add Freezed annotations
  - [ ] Add part files for generated code
  - [ ] Move business logic to extensions

- [ ] **Run Code Generation**
  - [ ] `flutter packages pub run build_runner build`
  - [ ] Verify generated files exist
  - [ ] Check for compilation errors

- [ ] **Update Dependencies**
  - [ ] Find all files importing the old model
  - [ ] Update imports to use Freezed version
  - [ ] Update any direct instantiations

- [ ] **Test Migration**
  - [ ] Run existing tests
  - [ ] Create new tests for Freezed functionality
  - [ ] Verify JSON serialization works
  - [ ] Test copyWith functionality

- [ ] **Clean Up**
  - [ ] Remove old model file
  - [ ] Update documentation
  - [ ] Commit changes

## Specific Migration Commands

### 1. Create Freezed Model
```bash
# Create new file
touch lib/audio/models/audio_recording_freezed.dart

# Add Freezed implementation
# (Copy template from user_freezed.dart)
```

### 2. Run Code Generation
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 3. Update Imports
```bash
# Find all files using the old model
grep -r "import.*audio_recording.dart" lib/

# Update each file to use the new import
# sed -i 's/audio_recording\.dart/audio_recording_freezed.dart/g' file.dart
```

### 4. Test Changes
```bash
flutter test
flutter analyze
```

## Testing Strategy

### Unit Tests for Each Migrated Model
```dart
group('AudioRecording Freezed Tests', () {
  test('should create AudioRecording with all fields', () {
    final recording = AudioRecording(/* ... */);
    expect(recording.id, isNotEmpty);
    expect(recording.filePath, isNotEmpty);
  });

  test('should support copyWith', () {
    final original = AudioRecording(/* ... */);
    final updated = original.copyWith(duration: Duration(minutes: 5));
    expect(updated.duration, Duration(minutes: 5));
    expect(updated.id, original.id); // Other fields unchanged
  });

  test('should serialize to JSON', () {
    final recording = AudioRecording(/* ... */);
    final json = recording.toJson();
    expect(json, isA<Map<String, dynamic>>());
  });

  test('should deserialize from JSON', () {
    final json = {/* ... */};
    final recording = AudioRecording.fromJson(json);
    expect(recording, isA<AudioRecording>());
  });

  test('should support equality', () {
    final recording1 = AudioRecording(/* ... */);
    final recording2 = AudioRecording(/* ... */);
    expect(recording1, equals(recording2));
  });
});
```

## Rollback Plan

If issues arise during migration:

1. **Keep Old Files**: Don't delete old models until migration is complete
2. **Feature Flags**: Use conditional imports if needed
3. **Gradual Migration**: Migrate one model at a time
4. **Testing**: Ensure all tests pass before proceeding

## Performance Impact

### Build Time
- **Initial**: Slight increase due to code generation
- **Subsequent**: Minimal impact with caching
- **Development**: Use `watch` mode for faster iteration

### Runtime Performance
- **Memory**: Slightly better due to immutable objects
- **CPU**: No impact, generated code is optimized
- **Bundle Size**: Minimal increase due to generated code

## Timeline

### Week 1: Setup and First Migration
- [ ] Complete Freezed setup (✅ Done)
- [ ] Migrate AudioRecording model
- [ ] Test and validate

### Week 2: Core Models
- [ ] Migrate AudioFileInfo model
- [ ] Migrate AudioSettings model
- [ ] Update all dependent code

### Week 3: API Models
- [ ] Migrate LoginResponseModel
- [ ] Migrate RegistrationResponseModel
- [ ] Migrate ResetPasswordResponseModel

### Week 4: Cleanup and Optimization
- [ ] Remove old model files
- [ ] Update documentation
- [ ] Performance testing
- [ ] Team training

## Success Metrics

- [ ] **Code Reduction**: 60%+ reduction in model boilerplate
- [ ] **Test Coverage**: Maintain 100% test coverage
- [ ] **Performance**: No regression in app performance
- [ ] **Build Time**: <5% increase in build time
- [ ] **Developer Experience**: Improved productivity

## Support and Resources

- **Documentation**: `FREEZED_IMPLEMENTATION_GUIDE.md`
- **Examples**: `lib/features/auth/domain/entities/user_freezed.dart`
- **Tests**: `test/freezed_demo_test.dart`
- **Community**: [Freezed GitHub](https://github.com/rrousselGit/freezed)

## Next Steps

1. **Review this guide** with the development team
2. **Start with AudioRecording** as it's the most complex
3. **Create migration branch** for each model
4. **Test thoroughly** before merging
5. **Document lessons learned** for future migrations

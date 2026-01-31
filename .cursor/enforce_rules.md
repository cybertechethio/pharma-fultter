# Cursor AI Enforcement Rules

## 🚨 CRITICAL: These rules are MANDATORY for ALL code generation

### BEFORE GENERATING ANY CODE:
1. **READ** the `.cursorrules` file completely
2. **VERIFY** the Clean Architecture pattern is followed
3. **ENSURE** Either<Failure, Success> pattern is used
4. **CONFIRM** RequestWrapper is implemented
5. **CHECK** proper error handling is in place
6. **VALIDATE** model-to-entity conversion exists
7. **GUARANTEE** proper disposal of resources
8. **ASSERT** proper validation is implemented

### REJECTION CRITERIA:
- ❌ Direct API calls in UI components
- ❌ Missing Either pattern in repositories/use cases
- ❌ Unwrapped API requests
- ❌ Missing model conversion methods
- ❌ Improper error handling
- ❌ Missing resource disposal
- ❌ Unvalidated data
- ❌ Skipping Clean Architecture layers

### ACCEPTANCE CRITERIA:
- ✅ Complete data flow: UI → UseCase → Repository → DataSource → ApiService
- ✅ Either<Failure, Success> pattern in all business logic
- ✅ RequestWrapper for all API requests
- ✅ Proper model-to-entity conversion
- ✅ Comprehensive error handling
- ✅ Proper resource disposal
- ✅ Input validation
- ✅ Clean Architecture compliance

## 🎯 ENFORCEMENT COMMANDS:

When generating code, use these commands to enforce rules:

```
@.cursorrules ENFORCE: Generate [feature] following Clean Architecture with Either pattern, RequestWrapper, and proper error handling
```

```
@.cursorrules STRICT: Create [component] with complete data flow, model conversion, and proper disposal
```

```
@.cursorrules VALIDATE: Ensure [code] follows Either pattern, RequestWrapper, and Clean Architecture
```

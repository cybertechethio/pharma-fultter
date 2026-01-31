# Code Generation Validation Checklist

## ✅ MANDATORY VALIDATION STEPS

### Before Accepting Any Generated Code:

#### 1. **Clean Architecture Compliance**
- [ ] UI layer only handles presentation logic
- [ ] UseCase layer contains business logic
- [ ] Repository layer handles data access
- [ ] DataSource layer handles API calls
- [ ] No direct API calls in UI components
- [ ] Proper dependency injection with Riverpod

#### 2. **Either Pattern Validation**
- [ ] All repository methods return `Either<Failure, Success>`
- [ ] All use case methods return `Either<Failure, Success>`
- [ ] Proper error handling with `fold()` method
- [ ] No try-catch blocks without Either pattern
- [ ] Proper error mapping from ApiException to Failure

#### 3. **RequestWrapper Validation**
- [ ] All API requests use RequestWrapper.wrap()
- [ ] No direct API calls without wrapping
- [ ] Proper meta information (request_id, client, version)
- [ ] Automatic wrapping in ApiService

#### 4. **Model Conversion Validation**
- [ ] Request models have `toApiJson()` method
- [ ] Response models have `toEntity()` method
- [ ] Proper model-to-entity conversion
- [ ] No direct model usage in domain layer
- [ ] Proper validation in request models

#### 5. **Error Handling Validation**
- [ ] Comprehensive error handling in all layers
- [ ] Proper error mapping from ApiException to Failure
- [ ] User-friendly error messages
- [ ] Proper error display in UI
- [ ] No silent failures

#### 6. **Resource Management Validation**
- [ ] Proper disposal of controllers
- [ ] Proper disposal of focus nodes
- [ ] Proper disposal of streams
- [ ] No memory leaks
- [ ] Proper cleanup in dispose() methods

#### 7. **State Management Validation**
- [ ] Proper Riverpod provider usage
- [ ] Proper state management patterns
- [ ] Proper loading states
- [ ] Proper error states
- [ ] Proper success states

#### 8. **Form Validation**
- [ ] Input validation before API calls
- [ ] Proper form validation
- [ ] User feedback for validation errors
- [ ] Proper form submission handling
- [ ] Loading states during submission

## 🚨 REJECTION TRIGGERS:

If ANY of these are found, REJECT the generated code:
- Direct API calls in UI components
- Missing Either pattern in business logic
- Unwrapped API requests
- Missing model conversion methods
- Improper error handling
- Missing resource disposal
- Unvalidated data
- Skipping Clean Architecture layers

## ✅ ACCEPTANCE TRIGGERS:

Code is acceptable ONLY if ALL validation steps pass:
- Complete Clean Architecture compliance
- Proper Either pattern usage
- RequestWrapper integration
- Model conversion implementation
- Comprehensive error handling
- Proper resource management
- Proper state management
- Proper form validation

# Cursor AI Prompts for Strict Rule Enforcement

## 🚨 MANDATORY PROMPTS FOR CODE GENERATION

### **1. Feature Generation Prompt**
```
@.cursorrules ENFORCE: Generate a complete [feature_name] feature following Clean Architecture with:

MANDATORY REQUIREMENTS:
- Either<Failure, Success> pattern in ALL business logic
- RequestWrapper for ALL API requests
- Complete data flow: UI → UseCase → Repository → DataSource → ApiService
- Proper model-to-entity conversion with extension methods
- Comprehensive error handling with Failure types
- Proper resource disposal and memory management
- Input validation in request models
- Riverpod providers for dependency injection

VALIDATION CHECKLIST:
- [ ] UI layer only handles presentation
- [ ] UseCase layer contains business logic
- [ ] Repository layer handles data access
- [ ] DataSource layer handles API calls
- [ ] All methods return Either<Failure, Success>
- [ ] All requests use RequestWrapper
- [ ] All models have conversion methods
- [ ] All resources are properly disposed
- [ ] All inputs are validated
- [ ] All errors are properly handled

REJECT if ANY requirement is missing.
```

### **2. Component Generation Prompt**
```
@.cursorrules STRICT: Create a [component_name] component with:

MANDATORY PATTERNS:
- Proper error handling with Either pattern
- Proper resource disposal
- Proper state management with Riverpod
- Proper validation
- Proper accessibility support
- Proper theme integration
- Proper internationalization

ENFORCEMENT:
- NO direct API calls in UI components
- NO missing error handling
- NO missing resource disposal
- NO missing validation
- NO missing accessibility
- NO missing theme support
- NO missing internationalization

VALIDATE before accepting.
```

### **3. API Integration Prompt**
```
@.cursorrules VALIDATE: Integrate [api_endpoint] with:

MANDATORY IMPLEMENTATION:
- RequestWrapper for request formatting
- Either<Failure, Success> for error handling
- Proper model-to-entity conversion
- Comprehensive error mapping
- Proper validation
- Complete data flow

ENFORCEMENT CHECKLIST:
- [ ] Request wrapped with RequestWrapper
- [ ] Response handled with Either pattern
- [ ] Model converted to entity
- [ ] Errors mapped to Failure types
- [ ] Input validated
- [ ] Complete data flow implemented

REJECT if incomplete.
```

### **4. Error Handling Prompt**
```
@.cursorrules ENFORCE: Implement error handling for [operation] with:

MANDATORY ERROR HANDLING:
- Either<Failure, Success> pattern
- Proper error mapping from ApiException to Failure
- User-friendly error messages
- Proper error display in UI
- Comprehensive error types
- Proper error recovery

VALIDATION:
- [ ] Either pattern used
- [ ] Error mapping implemented
- [ ] User-friendly messages
- [ ] UI error display
- [ ] Error types defined
- [ ] Error recovery handled

ACCEPT only if complete.
```

## 🎯 **USAGE INSTRUCTIONS**

### **For Feature Generation:**
1. Use the Feature Generation Prompt
2. Replace `[feature_name]` with actual feature name
3. Ensure all mandatory requirements are met
4. Validate against the checklist
5. Reject if incomplete

### **For Component Generation:**
1. Use the Component Generation Prompt
2. Replace `[component_name]` with actual component name
3. Ensure all mandatory patterns are followed
4. Validate against enforcement rules
5. Accept only if complete

### **For API Integration:**
1. Use the API Integration Prompt
2. Replace `[api_endpoint]` with actual endpoint
3. Ensure all mandatory implementation is complete
4. Validate against the checklist
5. Reject if incomplete

### **For Error Handling:**
1. Use the Error Handling Prompt
2. Replace `[operation]` with actual operation
3. Ensure all mandatory error handling is implemented
4. Validate against requirements
5. Accept only if complete

## 🚨 **ENFORCEMENT COMMANDS**

### **Strict Mode Commands:**
- `@.cursorrules ENFORCE:` - Force strict rule compliance
- `@.cursorrules STRICT:` - Enable strict validation
- `@.cursorrules VALIDATE:` - Validate against all rules
- `@.cursorrules REJECT:` - Reject if rules not followed

### **Validation Commands:**
- `@.cursorrules CHECK:` - Check rule compliance
- `@.cursorrules VERIFY:` - Verify implementation
- `@.cursorrules CONFIRM:` - Confirm pattern usage
- `@.cursorrules ASSURE:` - Assure quality standards

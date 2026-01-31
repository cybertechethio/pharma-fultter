# Cursor AI Enforcement Guide

## 🚨 **STRICT RULE ENFORCEMENT**

This guide explains how to force Cursor AI to strictly follow the Clean Architecture patterns defined in `.cursorrules`.

## 📋 **Enforcement Files Created**

### **1. `.cursor/enforce_rules.md`**
- Contains mandatory rules for ALL code generation
- Defines rejection and acceptance criteria
- Provides enforcement commands

### **2. `.cursor/validation_checklist.md`**
- Comprehensive validation checklist
- Mandatory validation steps
- Rejection and acceptance triggers

### **3. `.cursor/enforce_architecture.dart`**
- Reference implementation of enforced patterns
- Shows mandatory code structures
- Demonstrates proper patterns

### **4. `.cursor/ai_prompts.md`**
- Pre-defined prompts for strict rule enforcement
- Mandatory prompts for different scenarios
- Usage instructions and enforcement commands

### **5. `.cursor/config.json`**
- Cursor AI configuration for strict enforcement
- All enforcement flags enabled
- Strict validation settings

### **6. `.vscode/settings.json`**
- VS Code settings for Cursor AI enforcement
- Strict mode enabled
- All validation flags active

## 🎯 **How to Use Enforcement**

### **1. For Feature Generation:**
```
@.cursorrules ENFORCE: Generate a complete [feature_name] feature following Clean Architecture with Either pattern, RequestWrapper, and proper error handling
```

### **2. For Component Generation:**
```
@.cursorrules STRICT: Create [component_name] with complete data flow, model conversion, and proper disposal
```

### **3. For API Integration:**
```
@.cursorrules VALIDATE: Ensure [api_endpoint] follows Either pattern, RequestWrapper, and Clean Architecture
```

### **4. For Error Handling:**
```
@.cursorrules ENFORCE: Implement error handling for [operation] with Either pattern and proper error mapping
```

## 🔧 **Enforcement Mechanisms**

### **1. Strict Mode**
- All enforcement flags enabled
- Rejection on rule violations
- Validation before acceptance

### **2. Mandatory Patterns**
- Either<Failure, Success> pattern
- RequestWrapper integration
- Clean Architecture compliance
- Proper error handling
- Model-to-entity conversion
- Resource disposal
- Input validation

### **3. Validation Checklist**
- 8 mandatory validation steps
- Comprehensive compliance checking
- Rejection triggers for violations
- Acceptance criteria for compliance

### **4. Enforcement Commands**
- `@.cursorrules ENFORCE:` - Force strict compliance
- `@.cursorrules STRICT:` - Enable strict validation
- `@.cursorrules VALIDATE:` - Validate against all rules
- `@.cursorrules REJECT:` - Reject if rules not followed

## 🚨 **Rejection Criteria**

Code will be REJECTED if ANY of these are found:
- ❌ Direct API calls in UI components
- ❌ Missing Either pattern in business logic
- ❌ Unwrapped API requests
- ❌ Missing model conversion methods
- ❌ Improper error handling
- ❌ Missing resource disposal
- ❌ Unvalidated data
- ❌ Skipping Clean Architecture layers

## ✅ **Acceptance Criteria**

Code is acceptable ONLY if ALL validation steps pass:
- ✅ Complete Clean Architecture compliance
- ✅ Proper Either pattern usage
- ✅ RequestWrapper integration
- ✅ Model conversion implementation
- ✅ Comprehensive error handling
- ✅ Proper resource management
- ✅ Proper state management
- ✅ Proper form validation

## 🎯 **Best Practices**

### **1. Always Use Enforcement Commands**
- Start every code generation request with enforcement commands
- Use specific prompts for different scenarios
- Validate against the checklist before accepting

### **2. Follow the Complete Data Flow**
- UI → UseCase → Repository → DataSource → ApiService → Backend
- Never skip layers
- Always use proper error handling

### **3. Implement All Mandatory Patterns**
- Either<Failure, Success> pattern
- RequestWrapper integration
- Model-to-entity conversion
- Proper error handling
- Resource disposal
- Input validation

### **4. Validate Before Acceptance**
- Check against the validation checklist
- Ensure all mandatory patterns are implemented
- Verify Clean Architecture compliance
- Confirm proper error handling
- Validate resource management

## 🔧 **Troubleshooting**

### **If Cursor AI Ignores Rules:**
1. Check `.cursor/config.json` settings
2. Verify `.vscode/settings.json` configuration
3. Use enforcement commands in prompts
4. Reference enforcement files explicitly
5. Use strict validation prompts

### **If Code Generation is Rejected:**
1. Review rejection criteria
2. Check validation checklist
3. Ensure all mandatory patterns are implemented
4. Verify Clean Architecture compliance
5. Confirm proper error handling

### **If Patterns are Missing:**
1. Reference `.cursor/enforce_architecture.dart`
2. Use enforcement prompts
3. Check mandatory pattern requirements
4. Validate against the checklist
5. Ensure complete implementation

## 📚 **Reference Files**

- `.cursorrules` - Main rule definitions
- `.cursor/enforce_rules.md` - Enforcement rules
- `.cursor/validation_checklist.md` - Validation checklist
- `.cursor/enforce_architecture.dart` - Reference implementation
- `.cursor/ai_prompts.md` - Enforcement prompts
- `.cursor/config.json` - Cursor configuration
- `.vscode/settings.json` - VS Code settings

## 🎯 **Success Metrics**

### **Code Quality Indicators:**
- ✅ 100% Clean Architecture compliance
- ✅ 100% Either pattern usage
- ✅ 100% RequestWrapper integration
- ✅ 100% proper error handling
- ✅ 100% resource disposal
- ✅ 100% input validation
- ✅ 100% model conversion
- ✅ 100% proper state management

### **Maintainability Indicators:**
- ✅ Clear separation of concerns
- ✅ Proper dependency injection
- ✅ Comprehensive error handling
- ✅ Proper resource management
- ✅ Input validation
- ✅ Model conversion
- ✅ Clean Architecture compliance
- ✅ Proper testing patterns

This enforcement system ensures that ALL generated code follows the established Clean Architecture patterns and maintains the highest quality standards.

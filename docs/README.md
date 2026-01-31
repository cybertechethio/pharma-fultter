# 📚 Project Documentation

This directory contains all project documentation, guides, and implementation notes.

## 📋 Documentation Index

### 🏗️ Architecture & Development
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Project architecture overview
- **[CODE_GENERATION_GUIDE.md](CODE_GENERATION_GUIDE.md)** - Comprehensive code generation standards and patterns
- **[STATE_MANAGEMENT.md](STATE_MANAGEMENT.md)** - Riverpod state management patterns
- **[MIGRATION_GUIDE.md](MIGRATION_GUIDE.md)** - Migration and upgrade guides

### 🔧 Implementation Guides
- **[FREEZED_IMPLEMENTATION_GUIDE.md](FREEZED_IMPLEMENTATION_GUIDE.md)** - Freezed code generation setup
- **[LOCALIZATION_SETUP_COMPLETE.md](LOCALIZATION_SETUP_COMPLETE.md)** - Internationalization implementation
- **[LOGIN_SCREEN_IMPLEMENTATION.md](LOGIN_SCREEN_IMPLEMENTATION.md)** - Authentication system implementation

### 📅 Feature Implementation
- **[CALENDAR_IMPLEMENTATION_COMPLETE.md](CALENDAR_IMPLEMENTATION_COMPLETE.md)** - Dual calendar system (Gregorian & Ethiopian)
- **[DATE_CONVERSION_FIX.md](DATE_CONVERSION_FIX.md)** - Date conversion fixes and improvements
- **[DATE_STORAGE_STRATEGY_GUIDE.md](DATE_STORAGE_STRATEGY_GUIDE.md)** - Date storage and persistence strategies
- **[TIMEZONE_FIX.md](TIMEZONE_FIX.md)** - Timezone handling and fixes

### 🎵 Audio System
- **[AUDIO_RECORDING_BACKUP.md](AUDIO_RECORDING_BACKUP.md)** - Audio recording system documentation and backup

### 🚀 Deployment & Operations
- **[API_INTEGRATION.md](API_INTEGRATION.md)** - API integration patterns and examples
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Deployment guides and procedures
- **[TESTING.md](TESTING.md)** - Testing strategies and patterns
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Contribution guidelines
- **[CHANGELOG.md](CHANGELOG.md)** - Project changelog and version history

## 📝 Documentation Standards

### File Naming Convention
- Use `UPPERCASE_WITH_UNDERSCORES.md` for main documentation files
- Use descriptive names that clearly indicate the content
- Include implementation status in the filename when applicable (e.g., `_COMPLETE.md`, `_GUIDE.md`)

### Content Structure
Each documentation file should follow this structure:
1. **Title** - Clear, descriptive title
2. **Overview** - Brief description of the content
3. **Implementation Details** - Technical details and code examples
4. **Usage Examples** - Practical examples and usage patterns
5. **Status** - Current implementation status and notes

### Code Examples
- Always include working code examples
- Use proper syntax highlighting
- Include both simple and complex use cases
- Provide context and explanations for code snippets

## 🔄 Documentation Maintenance

### Adding New Documentation
1. Create new `.md` files in this `docs/` directory
2. Follow the naming convention above
3. Update this README.md index
4. Include proper cross-references to related documentation

### Updating Existing Documentation
1. Keep documentation current with code changes
2. Update examples when APIs change
3. Mark deprecated features clearly
4. Maintain backward compatibility notes

## 📖 Quick Reference

### Most Important Documents
- **[CODE_GENERATION_GUIDE.md](CODE_GENERATION_GUIDE.md)** - Essential for all code generation
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Understanding project structure
- **[STATE_MANAGEMENT.md](STATE_MANAGEMENT.md)** - Riverpod patterns and usage

### Feature-Specific Guides
- **Calendar System**: `CALENDAR_IMPLEMENTATION_COMPLETE.md` + `DATE_CONVERSION_FIX.md`
- **Audio Recording**: `AUDIO_RECORDING_BACKUP.md`
- **Localization**: `LOCALIZATION_SETUP_COMPLETE.md`
- **Authentication**: `LOGIN_SCREEN_IMPLEMENTATION.md`

---

**Note**: All documentation should be kept in this `docs/` directory. The root directory should remain clean of documentation files for better project organization.

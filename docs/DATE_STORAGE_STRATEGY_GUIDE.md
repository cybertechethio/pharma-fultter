# 📚 Date Storage & Display Strategy Guide

## 🎯 Core Principle

> **Always store Gregorian (GC) dates. Display Ethiopian (EC) or Gregorian based on language.**

```
┌─────────────────────────────────┐
│      STORAGE (Backend/DB)       │
│   Always: Gregorian Calendar    │
│   Format: ISO 8601 (UTC)        │
│   Example: "2025-01-15T00:00:00.000Z" │
└────────────┬────────────────────┘
             │
    ┌────────┴────────┐
    │                 │
    ▼                 ▼
┌─────────┐      ┌─────────┐
│ English │      │ Amharic │
│ Show GC │      │ Show EC │
└─────────┘      └─────────┘
 "Jan 15        "ጥር 6
  2025"          2017"
```

---

## 📦 Available Components

### 1. **SmartDateDisplay** - Recommended for most cases
Auto-switches between GC/EC based on language.

```dart
SmartDateDisplay(
  date: DateTime(2025, 1, 15),  // Always pass GC
)
// English: "January 15, 2025"
// Amharic: "ጥር 6, 2017"
```

### 2. **DualDateDisplay** - Shows both formats
Useful for admin panels or when you need both.

```dart
DualDateDisplay(
  date: DateTime(2025, 1, 15),
)
// Shows both:
// GC: January 15, 2025
// ET: ጥር 6, 2017
```

### 3. **DualCalendarPicker** - Date selection
Returns GC DateTime for storage.

```dart
DualCalendarPicker.show(
  context: context,
  onDateSelected: (gregorian, ethiopian) {
    // ✅ Always store gregorian
    saveDate(gregorian);
  },
);
```

---

## 💻 Complete Usage Examples

### Example 1: User Profile with Birth Date

```dart
class UserProfile {
  final String name;
  final DateTime birthDate;  // ✅ Always stored as GC
  
  UserProfile({
    required this.name,
    required this.birthDate,
  });
  
  // ✅ Serialize for backend (ISO 8601)
  Map<String, dynamic> toJson() => {
    'name': name,
    'birth_date': CalendarConverter.toBackendFormat(birthDate),
  };
  
  // ✅ Deserialize from backend
  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    name: json['name'],
    birthDate: CalendarConverter.fromBackendFormat(json['birth_date']),
  );
}

// Display in UI
class ProfileScreen extends StatelessWidget {
  final UserProfile user;
  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Birth Date:'),
        SmartDateDisplay(date: user.birthDate),  // Auto GC/EC
      ],
    );
  }
}
```

### Example 2: Event Creation Form

```dart
class EventFormScreen extends StatefulWidget {
  @override
  State<EventFormScreen> createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  DateTime? _eventDate;  // ✅ Stored as GC
  
  Future<void> _selectDate() async {
    final locale = Localizations.localeOf(context);
    
    await DualCalendarPicker.show(
      context: context,
      initialDate: _eventDate ?? DateTime.now(),
      // Auto-select calendar based on language
      initialCalendarType: locale.languageCode == 'am'
          ? CalendarType.ethiopian
          : CalendarType.gregorian,
      onDateSelected: (gregorian, ethiopian) {
        setState(() {
          _eventDate = gregorian;  // ✅ Store GC
        });
      },
    );
  }
  
  Future<void> _saveEvent() async {
    if (_eventDate == null) return;
    
    // ✅ Send to backend
    await api.post('/events', {
      'title': _titleController.text,
      'event_date': CalendarConverter.toBackendFormat(_eventDate!),
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display selected date
        if (_eventDate != null)
          SmartDateDisplay(date: _eventDate!),
        
        // Select button
        ElevatedButton(
          onPressed: _selectDate,
          child: Text('Select Date'),
        ),
      ],
    );
  }
}
```

### Example 3: Birthday Reminder App

```dart
class Birthday {
  final String personName;
  final DateTime date;  // ✅ Always GC
  
  Birthday({required this.personName, required this.date});
  
  // Check if birthday is today (works regardless of calendar)
  bool get isToday {
    final now = DateTime.now();
    return date.month == now.month && date.day == now.day;
  }
}

class BirthdayCard extends StatelessWidget {
  final Birthday birthday;
  
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Card(
      child: ListTile(
        title: Text(birthday.personName),
        subtitle: SmartDateDisplay(date: birthday.date),
        trailing: birthday.isToday
            ? Icon(Icons.cake, color: Colors.red)
            : null,
      ),
    );
  }
}
```

### Example 4: Backend API Integration

```dart
class ApiService {
  // ✅ Send date to backend
  Future<void> createAppointment({
    required DateTime appointmentDate,
    required String notes,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/appointments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'appointment_date': CalendarConverter.toBackendFormat(appointmentDate),
        'notes': notes,
      }),
    );
    
    if (response.statusCode != 200) {
      throw Exception('Failed to create appointment');
    }
  }
  
  // ✅ Receive date from backend
  Future<List<Appointment>> getAppointments() async {
    final response = await http.get(
      Uri.parse('$baseUrl/appointments'),
    );
    
    final List data = jsonDecode(response.body);
    
    return data.map((json) => Appointment(
      id: json['id'],
      date: CalendarConverter.fromBackendFormat(json['appointment_date']),
      notes: json['notes'],
    )).toList();
  }
}
```

### Example 5: Date Range Selection

```dart
class DateRangeSelector extends StatefulWidget {
  @override
  State<DateRangeSelector> createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateTime? _startDate;  // ✅ GC
  DateTime? _endDate;    // ✅ GC
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Start date
        ListTile(
          title: Text('Start Date'),
          subtitle: _startDate != null
              ? SmartDateDisplay(date: _startDate!)
              : Text('Not selected'),
          onTap: () => _selectStartDate(),
        ),
        
        // End date
        ListTile(
          title: Text('End Date'),
          subtitle: _endDate != null
              ? SmartDateDisplay(date: _endDate!)
              : Text('Not selected'),
          onTap: () => _selectEndDate(),
        ),
        
        // Summary
        if (_startDate != null && _endDate != null)
          Text(
            'Duration: ${_endDate!.difference(_startDate!).inDays} days',
          ),
      ],
    );
  }
}
```

---

## 🔧 Helper Methods Reference

### Backend Integration

```dart
// ✅ Convert to backend format (ISO 8601)
String isoString = CalendarConverter.toBackendFormat(date);
// "2025-01-15T00:00:00.000Z"

// ✅ Parse from backend
DateTime date = CalendarConverter.fromBackendFormat(isoString);

// ✅ JSON serialization (same as backend format)
String json = CalendarConverter.toJsonFormat(date);
DateTime parsed = CalendarConverter.fromJsonFormat(json);
```

### Display Formatting

```dart
// ✅ Smart display (auto GC/EC based on language)
String display = CalendarConverter.formatForDisplay(date, context, l10n);

// ✅ Force Gregorian
String gc = CalendarConverter.formatGregorianDate(date, context);

// ✅ Force Ethiopian
EtDatetime et = CalendarConverter.toEthiopian(date);
String ec = CalendarConverter.formatEthiopianDate(et, l10n);
```

### Conversion

```dart
// ✅ GC → ET
EtDatetime ethiopian = CalendarConverter.toEthiopian(gregorian);

// ✅ ET → GC
DateTime gregorian = CalendarConverter.toGregorian(ethiopian);
```

---

## 🎨 UI Patterns

### Pattern 1: Simple Display
```dart
SmartDateDisplay(date: storedDate)
```

### Pattern 2: With Label
```dart
SmartDateDisplayWithLabel(date: storedDate)
```

### Pattern 3: Both Formats
```dart
DualDateDisplay(date: storedDate)
```

### Pattern 4: In Form Field
```dart
SmartDateFormField(
  date: selectedDate,
  label: 'Birth Date',
  onDateSelected: (date) {
    setState(() => selectedDate = date);
  },
)
```

---

## 📝 Best Practices

### ✅ DO:
1. **Always store Gregorian DateTime**
   ```dart
   DateTime birthDate;  // ✅ Good
   ```

2. **Use SmartDateDisplay for UI**
   ```dart
   SmartDateDisplay(date: birthDate)  // ✅ Auto GC/EC
   ```

3. **Use ISO 8601 for backend**
   ```dart
   CalendarConverter.toBackendFormat(date)  // ✅ Standard
   ```

4. **Let picker return both formats**
   ```dart
   onDateSelected: (gc, et) {
     saveDate(gc);  // ✅ Store GC
   }
   ```

### ❌ DON'T:
1. **Don't store Ethiopian dates**
   ```dart
   EtDatetime birthDate;  // ❌ Wrong! Store GC instead
   ```

2. **Don't hardcode calendar in display**
   ```dart
   formatEthiopianDate(...)  // ❌ Not responsive to language
   // Use SmartDateDisplay instead
   ```

3. **Don't send raw DateTime to backend**
   ```dart
   'date': date.toString()  // ❌ Not standard
   // Use toBackendFormat() instead
   ```

4. **Don't mix storage formats**
   ```dart
   // ❌ Inconsistent
   DateTime event1Date;
   EtDatetime event2Date;
   
   // ✅ Consistent
   DateTime event1Date;
   DateTime event2Date;
   ```

---

## 🧪 Testing Examples

```dart
// Test 1: Round-trip conversion
DateTime original = DateTime(2025, 1, 15);
EtDatetime et = CalendarConverter.toEthiopian(original);
DateTime back = CalendarConverter.toGregorian(et);
assert(original.year == back.year);
assert(original.month == back.month);
assert(original.day == back.day);

// Test 2: Backend format
String iso = CalendarConverter.toBackendFormat(original);
DateTime parsed = CalendarConverter.fromBackendFormat(iso);
assert(original.year == parsed.year);

// Test 3: Display based on locale
// English context
String displayEn = CalendarConverter.formatForDisplay(original, contextEn, l10nEn);
assert(displayEn.contains('January'));

// Amharic context
String displayAm = CalendarConverter.formatForDisplay(original, contextAm, l10nAm);
assert(displayAm.contains('ጥር'));
```

---

## 🌍 Multi-Language Support

The system automatically handles language switching:

```dart
// User switches to Amharic
// All SmartDateDisplay widgets automatically update to show ET dates

// User switches back to English  
// All SmartDateDisplay widgets automatically update to show GC dates

// The stored DateTime value NEVER changes
// Only the display format changes
```

---

## 🎉 Summary

**Key Takeaways:**
1. ✅ **Store**: Always Gregorian (ISO 8601)
2. ✅ **Display**: Auto GC/EC based on language
3. ✅ **Backend**: Use `toBackendFormat()` / `fromBackendFormat()`
4. ✅ **UI**: Use `SmartDateDisplay` widget
5. ✅ **Picker**: Returns both formats, store GC

This strategy ensures:
- ✅ Consistent data storage
- ✅ International compatibility
- ✅ Easy backend integration
- ✅ User-friendly display
- ✅ Language-responsive UI


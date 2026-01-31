# Global Snackbar Pattern

This project uses a global, context-free snackbar service so user feedback is reliable across navigation and disposed contexts.

## Why
- Works even if the current widget is disposed
- Survives route changes (attached to root overlay)
- Centralizes styling, duration, and variants

## Wiring
- GoRouter must be created with a root navigator key:

```dart
// routes/app_router.dart
return GoRouter(
  navigatorKey: SnackbarService.rootNavigatorKey,
  // ...
);
```

## Service API
- Provider: `snackbarServiceProvider`
- Variants:
  - `showSuccess(String message)`
  - `showError(Failure failure)`
  - `showWarning(String message)`
  - `showInfo(String message)`
- Defaults: 2s duration, no actions/labels, replace current snackbar

Internals:
- Attaches to root overlay (`rootNavigatorKey.currentState?.overlay?.context`)
- Schedules display on the next frame to avoid navigation races
- Uses Flushbar-based widgets under `lib/shared/snacks/`

## Snack Widgets
- `lib/shared/snacks/success_snack_bar.dart`
- `lib/shared/snacks/error_snack_bar.dart`
- `lib/shared/snacks/warning_snack_bar.dart`
- `lib/shared/snacks/info_snack_bar.dart`

Each widget supports a `Duration duration` (default 2s) and consistent theming via `AppColorExtension`.

## Usage Examples

### In listeners (recommended with Riverpod)
```dart
final snackbar = ref.read(snackbarServiceProvider);
ref.listen<AsyncValue<AuthState>>(authProvider, (prev, next) {
  next.whenOrNull(
    data: (state) => state.whenOrNull(
      authenticated: (message, user, tokens) {
        snackbar.showSuccess(message);
        context.go(RouteName.home);
      },
      error: (failure) => snackbar.showError(failure),
    ),
  );
});
```

### Top-level screens
If a Flushbar route makes `Navigator.canPop` true and shows a back arrow on root screens, hide it explicitly:
```dart
appBar: CustomAppBar(
  title: l10n.home,
  showBackButton: false,
)
```

## Do/Don't
- Do use `snackbarServiceProvider` everywhere (no BuildContext required)
- Do keep messages localized as needed via your feature logic
- Don’t use `ScaffoldMessenger.of(context)` for app-wide feedback
- Don’t create duplicate snackbar components; reuse `shared/snacks/*`

## References
- `lib/core/services/snackbar_service.dart`
- `lib/routes/app_router.dart`
- `lib/shared/snacks/*`

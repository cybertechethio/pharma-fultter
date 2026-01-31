import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/snacks/success_snack_bar.dart';
import '../../shared/snacks/error_snack_bar.dart';
import '../../shared/snacks/warning_snack_bar.dart';
import '../../shared/snacks/info_snack_bar.dart';
import '../../core/errors/failure.dart';

class SnackbarService {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get _overlayContext {
    final state = rootNavigatorKey.currentState;
    // Prefer the overlay context so the flushbar attaches above all routes
    return state?.overlay?.context ?? state?.context;
  }

  void _schedule(VoidCallback cb) {
    WidgetsBinding.instance.addPostFrameCallback((_) => cb());
  }

  void showSuccess(String message) {
    final ctx = _overlayContext;
    if (ctx == null) return;
    _schedule(() {
      SuccessSnackBar.show(ctx, message: message, duration: const Duration(seconds: 4));
    });
  }

  void showError(Failure failure) {
    final ctx = _overlayContext;
    if (ctx == null) return;
    _schedule(() {
      ErrorSnackBar.show(ctx, failure: failure, duration: const Duration(seconds: 4));
    });
  }

  void showWarning(String message) {
    final ctx = _overlayContext;
    if (ctx == null) return;
    _schedule(() {
      WarningSnackBar.show(ctx, message: message, duration: const Duration(seconds: 3));
    });
  }

  void showInfo(String message) {
    final ctx = _overlayContext;
    if (ctx == null) return;
    _schedule(() {
      InfoSnackBar.show(ctx, message: message, duration: const Duration(seconds: 3));
    });
  }
}

final snackbarServiceProvider = Provider<SnackbarService>((ref) => SnackbarService());



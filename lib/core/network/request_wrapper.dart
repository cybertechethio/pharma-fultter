import 'package:uuid/uuid.dart';
import '../constants/app_constant.dart';

class RequestWrapper {
  static Map<String, dynamic> wrap(
     data, {
    String? requestId,
  }) {
    return {
      'metadata': {
        'requestId': requestId ?? const Uuid().v4(),
        'client': AppConstants.client,
        'version': AppConstants.version,
      },
      'data': data,
    };
  }
}

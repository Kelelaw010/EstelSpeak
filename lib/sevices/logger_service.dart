import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger();
  static void debug(String message) {
    _logger.d(message);
  }

  static void error(String message) {
    _logger.e(message);
  }
}

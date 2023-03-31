import 'package:uuid/uuid.dart';

class Configurations {
  final sessionId = const Uuid().v4();
  final traceId = const Uuid().v4().replaceAll('-', '');
  bool debugTracing = false;

  Configurations();

  String get traceFlags => debugTracing ? '01' : '00';

  String get errorCode => debugTracing ? traceId : traceId.substring(0, 8);
}

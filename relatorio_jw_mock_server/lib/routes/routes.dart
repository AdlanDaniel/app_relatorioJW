import 'package:relatorio_jw_mock_server/handlers/auth.dart';
import 'package:relatorio_jw_mock_server/handlers/publisher.dart';
import 'package:shelf_router/shelf_router.dart';

Router routes() => Router()
  ..publisherRoutes()
  ..authRoutes();

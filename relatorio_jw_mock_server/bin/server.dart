import 'package:relatorio_jw_mock_server/middlewares/json_contenty_type.dart';
import 'package:relatorio_jw_mock_server/routes/routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf;

void main(List<String> args) async {
  String host = '0.0.0.0';
  int port = 8080;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addJsonContentType()
      .addHandler(routes());

  // For running in containers, we respect the PORT environment variable.
  // final port = int.parse(Platform.environment['PORT'] ?? '8080');
  // final server = await serve(handler, ip, port);
  // print('Server listening on port ${server.port}');
  // shelf.serve(handler, host, port)
  //   ..then((server) {
  //     print('Serving at http://${server.address.host}:${server.port}');
  //   });
  final server = await shelf.serve(handler, host, port);

  print('Serving at http://${server.address.host}:${server.port}');
}

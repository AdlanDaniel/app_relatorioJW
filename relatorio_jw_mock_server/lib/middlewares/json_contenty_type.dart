import 'dart:io';

import 'package:shelf/shelf.dart';

extension JsonContentType on Pipeline {
  Pipeline addJsonContentType() {
    return addMiddleware(
      (innerHandler) => (request) async {
        final headers = {HttpHeaders.contentTypeHeader: ContentType.json.value};
        final response = await innerHandler.call(request);
        return response.change(headers: headers);
      },
    );
  }
}

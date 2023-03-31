import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

extension Publisher on Router {
  void publisherRoutes() {
    post('/v1/auth/login', signIn);
    post('/v1/auth/logout', signOut);
    post('/v1/publisher/create', createPublisher);
    get('/v1/publisher/me', me);
    get('/v1/publisher/', getInformationPublisher);
  }

  Future<Response> signIn(Request request) async {
    await Future.delayed(Duration(seconds: 3));
    return Response.ok(jsonEncode(
      {
        'access_token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
            'eyJleHAiOjE2NzU1NjA1MTAsImlhdCI6MTY3NTQ3NDExM'
            'CwiaXNzIjoicmVsYXRvcmlvanciLCJuYmYiOjE2NzU0NzQ'
            'xMTAsInN1YiI6IjMifQ.DQVakgEXUQGIXRRX2RgEYjJDh4jy38ypiRyYr_PwnoI'
      },
    ));
    // return Response.forbidden(jsonEncode({'error': 'teste'}));
  }

  Future<Response> signOut(Request request) async {
    await Future.delayed(Duration(seconds: 3));
    return Response(200);
    // return Response.forbidden(jsonEncode({'error': 'teste'}));
  }

  Future<Response> createPublisher(Request request) async {
    await Future.delayed(Duration(seconds: 3));
    return Response(200);
    // return Response.badRequest();
  }

  Response me(Request request) {
    return Response.ok(
      jsonEncode(
        {
          'name': 'Daniel',
          'email': 'daniel@gmail.com',
          'personId': '22ff3f8a-ead2-4c23-9b42-90dec584cd33',
        },
      ),
    );
  }

  Future<Response> getInformationPublisher(Request request) async {
    await Future.delayed(Duration(seconds: 3));
    // return Response.badRequest();
    return Response.ok(
      jsonEncode(
        {
          "auxiliaryPioner": 1,
          'regularPioner': 0,
          'publisher': 1,
          'total': 1,
        },
      ),
    );
  }
}

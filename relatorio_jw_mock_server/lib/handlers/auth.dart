import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

extension Auth on Router {
  void authRoutes() {
    post('/v1/auth/login', signIn);
    post('/v1/auth/logout', signOut);
    post('/v1/auth/register', signUp);
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

  Future<Response> signUp(Request request) async {
    await Future.delayed(Duration(seconds: 3));

    return Response.ok(jsonEncode({}));
  }
}

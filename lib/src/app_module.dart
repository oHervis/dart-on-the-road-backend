import 'package:backend/src/modules/user/user_resource.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get(
            '/health-check', (Request request) => Response.ok('Health Check')),
        Route.resource(UserResource())
      ];
}

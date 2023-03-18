import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class UserResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/users', _getAllUser),
        Route.get('/users/:id', _getAllUserById),
        Route.post('/users/create', _createUser),
        Route.put('/users/:id', _editUser),
        Route.delete('/users/:id', _deleteUser),
      ];

  FutureOr<Response> _getAllUser(Request request) {
    return Response.ok('todos os usuarios');
  }

  FutureOr<Response> _getAllUserById(ModularArguments arguments) {
    var id = arguments.params['id'];
    if (id == null) {
      return Response.notFound('id não encontrado');
    }
    return Response.ok('Usuario $id');
  }

  FutureOr<Response> _createUser(ModularArguments arguments) {
    var data = arguments.data;
    var id = data['id'];
    if (id != null) {
      return Response.forbidden('Usuário já existe');
    }
    return Response.ok('Usuario criado com sucesso');
  }

  FutureOr<Response> _editUser(ModularArguments arguments) {
    var id = arguments.params['id'];
    var data = arguments.data;
    if (id == null) {
      return Response.notFound('Usuário não encontrado');
    }
    return Response.ok('Usuario editado com sucesso $data');
  }

  FutureOr<Response> _deleteUser(ModularArguments arguments) {
    var id = arguments.params['id'];
    if (id == null) {
      return Response.notFound('Usuário não encontrado');
    }
    return Response.ok('Usuario deleteado com sucesso $id');
  }
}

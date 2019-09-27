import 'package:dio/dio.dart';
import 'package:movies/core/model/people.dart';

import 'base.dart';

class PeopleService {
  PeopleService._();

  static Dio _dio = BaseService().dio;

  static Future<People> getPeople(String id) async {
    Response response = await _dio.get('/people/$id');
    return People.fromJson(response.data);
  }
}

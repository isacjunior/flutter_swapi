import 'package:dio/dio.dart';
import 'package:movies/core/constants/api.dart';

final BaseOptions options = BaseOptions(
  baseUrl: Api.base,
);

class BaseService {
  factory BaseService() {
    _singleton ??= BaseService._();
    return _singleton;
  }
  BaseService._();
  static BaseService _singleton;

  Dio _dio = Dio(options);

  get dio => _dio;
}

import 'package:dio/dio.dart';
import 'package:movies/core/constants/api.dart';

final BaseOptions options = BaseOptions(
  baseUrl: Api.base,
);

class BaseService {
  static final BaseService _singleton = BaseService._();
  factory BaseService() => _singleton;
  BaseService._();

  Dio _dio = Dio(options);

  get dio => _dio;
}

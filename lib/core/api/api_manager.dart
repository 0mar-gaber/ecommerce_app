import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constant.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(
        BaseOptions(
            baseUrl: Constant.baseUrl,
            validateStatus: (status){
              if(status!<500){
                return true;
              }
              return false;
            }
        )
    );

  }

  Future<dynamic> getRequest({required String endPoint, Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.get(endPoint, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // Handle other status codes
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }

  Future<Response> postRequest({required String endPoint , Map<String,dynamic>? body})async{
    return await dio.post(endPoint,data: body);
  }}

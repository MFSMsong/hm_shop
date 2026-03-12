
//基于Dio进行二次封装
import 'package:dio/dio.dart';
import 'package:myproject/contants/index.dart';

class DioRequest{
  final Dio _dio = Dio();

  DioRequest(){
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    //拦截器
    _addInterceptors();
  }

  //拦截器
  void _addInterceptors(){
    _dio.interceptors.add(
      InterceptorsWrapper(

      //在发送请求之前做一些事情
      onRequest: (request, handler) {
        return handler.next(request); //继续发送请求
      },

       //在收到响应数据之前做一些事情
      onResponse: (response, handler) {
        //Http状态码
        if(response.statusCode! >= 200 && response.statusCode! < 300){
          //成功
          return handler.next(response); //继续处理响应
        }
        //失败
        return handler.reject(DioException(requestOptions: response.requestOptions)); //继续处理错误
      },

      //在发生错误时做一些事情
      onError: (DioException e, handler) {
        return handler.reject(e); //继续处理错误
      },
    ));
  }

  Future<dynamic> get(String url,{Map<String,dynamic>? queryParameters}) async{
    try{
      dynamic response = await _handlerResonse(_dio.get(url,queryParameters: queryParameters));
      return response;
    }on DioException catch(e){
      throw Exception(e);
    }
  }

  //进一步处理返回结果,把data拿出来
  Future<dynamic> _handlerResonse(Future<Response<dynamic>> task) async{
    try{
      dynamic res = await task;
      final data = res.data as Map<String,dynamic>;
      if(data['code'] == GlobalConstants.SUCCESS_CODE){
        return data["result"];
      }

      //抛出异常
      throw Exception(data['msg']?? "加载数据异常" );

    }on DioException catch(e){
      throw Exception(e);
    }
  }
}


final dioRequest = DioRequest();//单例对象
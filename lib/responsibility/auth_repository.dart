import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  //use baseAPi initialize NetworkApi
  BaseApiServices _apiServices = NetworkApiServices();

  
  Future<dynamic> loginApi(dynamic data)async{
    
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginApi, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data)async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApi, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}
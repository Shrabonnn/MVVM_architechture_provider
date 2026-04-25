// need to link repository's Auth_repo with Auth_view_model
import 'package:flutter/cupertino.dart';
import 'package:mvvm/responsibility/auth_repository.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  // register
  Future<void> registerApi(dynamic data, BuildContext context) async{
    _myRepo.registerApi(data).then((value){
      print(value.toString());
    }).onError((error, value){
      print(error.toString());
    });
  }

  // log in
  Future<void> loginApi(dynamic data, BuildContext context) async{
    _myRepo.loginApi(data).then((value){
      print(value.toString());
    }).onError((error, value){
      print(error.toString());
    });
  }

}


import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username ,
      "password" : password  ,
      "email" : email ,
      "phone" : phone  ,
    });
    return response.fold((l) => l, (r) => r);
  }

  postupdatedata(String id ,String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.updatedata, {
      "id" : id ,
      "username" : username ,
      "password" : password  ,
      "email" : email ,
      "phone" : phone  ,
    });
    return response.fold((l) => l, (r) => r);
  }


}
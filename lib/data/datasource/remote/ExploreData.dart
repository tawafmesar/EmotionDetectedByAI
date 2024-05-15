import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class ExploreData{
  Crud crud ;

  ExploreData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);

  }

}
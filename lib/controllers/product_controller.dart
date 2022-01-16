import 'package:get/state_manager.dart';
import '/models/product.dart';
import '/services/product_service.dart';

class ProductController extends GetxController {
  ///  Using GetX we can create any variable as an Observable.
  var modelList = <Product>[].obs;
  final service = ProductService();

  ///  Here we override the init method, and call the http service in it.
  ///  This way, we will get the user list as soon as we create an instance of the controller.
  @override
  void onInit() {
    getItemsCtrl();
    super.onInit();
  }

  void index() async {
    var items = await service.index();
    modelList.value = items;
  }

  ///  On this method, we get the users and update the user Observable with the data retrieved.
  getItemsCtrl() async {
    var result = await service.index();
    modelList.addAll(result);
  }
}

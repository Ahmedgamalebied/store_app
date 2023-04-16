import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesServices(
      {required String category_name}) async {
    // http.Response response = await http.get(
    //     Uri.parse('https://fakestoreapi.com/products/category/$category_name'));
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');
    List<ProductModel> productsList = [];
    for (int i = 0; i <= data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}

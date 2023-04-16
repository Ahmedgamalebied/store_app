import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';

class categoriesSerivces {
  Future<List<dynamic>> getCategories() async {
    // http.Response response = await http
    //     .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}

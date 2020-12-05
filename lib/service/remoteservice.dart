import 'package:http/http.dart' as http;
import 'package:shop/model/product.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}

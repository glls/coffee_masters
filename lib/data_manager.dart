import 'dart:convert';

import 'package:http/http.dart' as http;

import 'data_model.dart';

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  fetchMenu() async {
    const url = "https://dev.d.cyberpunk.gr/api/menu.json";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = response.body;
        _menu = [];
        var decodeData = jsonDecode(body) as List<dynamic>;
        for (var json in decodeData) {
          _menu?.add(Category.fromJson(json));
        }
      } else {
        print('Failed to load menu: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e'); // Catch any exceptions and print them
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
    }
    if (!found) {
      cart.add(ItemInCart(product: p, quantity: 1));
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    var total = 0.0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}

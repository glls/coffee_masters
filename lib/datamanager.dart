import 'datamodel.dart';

class DataManager {
  List<Category>? menu;
  List<ItemInCart> cart = [];
  cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
        break;
      }
      if (!found) {
        cart.add(ItemInCart(product: p, quantity: 1));
      }
    }
  }

  cartRemome(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartCLear() {
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
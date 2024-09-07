import 'package:fisrt_app/models/products.dart';

class CartItem{
  Products products;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.products,
    required this.selectedAddons,
    this.quantity = 1,
});

  double get totalPrice{
    double addonsPrice = selectedAddons.fold(0, (sum, addon)=>sum+addon.price);
    return (products.price + addonsPrice) * quantity;
  }
}
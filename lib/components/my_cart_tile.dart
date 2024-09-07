import 'package:fisrt_app/components/my_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:fisrt_app/models/cart_item.dart';
import 'package:fisrt_app/models/store.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget{
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context){
    return Consumer<Store>(
      builder: (context, Store, child)=>Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                    cartItem.products.imagePath,
                    height: 140,
                    width: 140,
                   )
                  ),

                  const SizedBox(width: 10),

                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // product name
                      Text(cartItem.products.name),

                      const SizedBox(height: 10),

                      // product price
                      Text(
                          '\$'+cartItem.products.price.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)
                      ),

                      QuantitySelector(
                        quantity: cartItem.quantity,
                        products: cartItem.products,
                        onDecrement: (){
                          Store.removeFromCart(cartItem);
                        },
                        onIncrement: (){
                          Store.addToCart(
                              cartItem.products, cartItem.selectedAddons);
                        },
                      )
                    ],
                  ),

                  const Spacer(),

                  //increment or decrement quantity
                ],
              ),
      ),

            // addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const  EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                        (addon)=> Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                              label: Row(
                                children: [
                                  //add name
                                  Text(addon.name),

                                  //add price
                                  Text('(\$${addon.price})'),
                                ],
                              ),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Theme.of(context).colorScheme.primary
                                )
                            ),
                            onSelected: (value){},
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize:12,
                            ),
                          ),
                        ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
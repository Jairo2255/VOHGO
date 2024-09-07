import 'package:fisrt_app/components/my_button.dart';
import 'package:fisrt_app/components/my_cart_tile.dart';
import 'package:fisrt_app/pages/payment_page.dart';
import '../models/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget{
  const CartPage ({super.key});

  @override
  Widget build (BuildContext context){
    return Consumer<Store>(builder: (context, store, child){
      //cart
      final userCart = store.cart;

      //scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Tu carrito"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context)=> AlertDialog(
                        title: const Text(
                            "Estas seguro que desea eliminar su carrito"),
                        actions:[
                          //cancel button
                          TextButton(
                              onPressed: ()=> Navigator.pop(context),
                              child: const Text("Cancelar"),
                          ),

                          //yes button
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                              store.clearCart();
                            },
                            child: const Text("Si"),
                          ),
                        ],
                      ),
                  );
                },
                icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Column(
          children: [

            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                       child:Center(
                           child: Text("¡No seas tímido!, agrega algo...")
                          ),
                        )
                      : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                          itemBuilder: (context, index) {

                          // get individual cart item
                            final cartItem = userCart[index];

                          //Return cart tile UI
                            return MyCartTile(cartItem: cartItem);
                          },
                          ),
                      ),
                ],
              ),
            ),

            //button to pay
            MyButton(
              onTap: () =>Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context)=> const PaymentPage(),
                ),
              ),
                text:"Finalizar compra",
            ),

            const SizedBox(height: 25),
          ],
        ),
      );
    },);
  }
}
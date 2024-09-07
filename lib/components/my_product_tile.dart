import 'package:flutter/material.dart';
import '../models/products.dart';

class ProductsTile extends StatelessWidget {
  final Products products;
  final void Function()? onTap;

  const ProductsTile({
   super.key,
   required this.products,
   required this.onTap,
});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [

                // text product details
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products.name),
                        Text(
                          '\$'+products.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryFixed,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            products.description,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                        ),
                      ],
                    ),
                ),

                const SizedBox(width: 15),

                // Product image with fixed margin
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(products.imagePath, height: 100,),
                )
              ],
            ),
          ),
        ),
        //divider line
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
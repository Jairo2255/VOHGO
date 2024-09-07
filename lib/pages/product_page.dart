import 'package:fisrt_app/models/store.dart';
import 'package:flutter/material.dart';
import 'package:fisrt_app/models/products.dart';
import 'package:fisrt_app/components/my_button.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Products products;
  final Map<Addon, bool>selectedAddons={};

  ProductPage({
    super.key,
    required this.products
  }){
    // Initialize selected addons to be flase
    for (Addon addon in products.availableAddons){
      selectedAddons[addon]=false;
    }
  }

  @override
  State<ProductPage> createState()=> _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{

  // method to add to cart
  void addToCart(Products products, Map<Addon, bool> selectedAddons){

    // close the current  food page to go back to menu
    Navigator.pop(context);

    //format de selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.products.availableAddons){
      if(widget.selectedAddons[addon]==true){
        currentlySelectedAddons.add(addon);
      }
    }
    
    // add to cart
    context.read<Store>().addToCart(products, currentlySelectedAddons);
  }



  @override
  Widget build(BuildContext context){
    return Stack(children: [
      // scaffold UI
        Scaffold(
    body: SingleChildScrollView(
    child: Column(
    children: [
      const SizedBox(height: 80),
    // product image
    Image.asset(widget.products.imagePath, height: 290),
    Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Product name
    Text(
    widget.products.name,
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    ),
    ),

    //product price
    Text(
    '\$'+widget.products.price.toString(),
    style: TextStyle(
    fontSize: 16,
    color: Theme.of(context).colorScheme.primaryFixed,
    ),
    ),


    //product description
    Text(widget.products.description),

    const SizedBox(height: 10),

    Divider(color: Theme.of(context).colorScheme.secondary),

    const SizedBox(height: 10),

    //addons
    Text(
    "¿Algo más?",
    style: TextStyle(
    color: Theme.of(context).colorScheme.inversePrimary,
    fontSize: 16,
    fontWeight: FontWeight.bold
    ),
    ),
    const SizedBox(height: 10),
    Container(
    decoration: BoxDecoration(
    border: Border.all(
    color: Theme.of(context).colorScheme.secondary),
    borderRadius: BorderRadius.circular(8),
    ),
    child: ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: widget.products.availableAddons.length,
    itemBuilder: (context, index){
    // get individual addon
    Addon addon=widget.products.availableAddons[index];

    //return check box UI
    return CheckboxListTile(
    title: Text(addon.name),
    subtitle: Text(
    '\$${addon.price}',
    style: TextStyle(
    color: Theme.of(context).colorScheme.primaryFixed,
    ),
    ),
    value: widget.selectedAddons[addon],
    onChanged: (bool? value){
    setState(() {
    widget.selectedAddons[addon]=value!;
    });
    },
    );
    },
    ),
    )
    ],
    ),
    ),

    // button -> add to cart
    MyButton(
    onTap: () => addToCart(widget.products, widget.selectedAddons),
    text: "Añadir al carrito",
    ),

    const SizedBox(height: 25),
    ],
    ),
    ),
    ),
    // back button
      SafeArea(
        child: Opacity(
          opacity: 0.5,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration:
            BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: ()=>Navigator.pop(context),
            ),
          ),
        ),
      ),

    ],
    );
  }
}
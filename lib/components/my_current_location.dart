import 'package:fisrt_app/models/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget{
  MyCurrentLocation({super.key});

  final TextEditingController textController = TextEditingController();


  void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Tu universidad o lugar de entrega..."),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(
            hintText: "Universidad...",
          ),
        ),
          actions: [
            //cancel button
            MaterialButton(
                onPressed: ()=>Navigator.pop(context),
                child: const Text('Cancelar'),
            ),

            //save button
            MaterialButton(
              onPressed: (){
                // update delivery addres
                String newAddres = textController.text;
                context.read<Store>().updateDeliveryAddress(newAddres);
                Navigator.pop(context);
                textController.clear();
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(25.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
        child: Row(
          children: [
            // address
            Consumer<Store>(
                builder: (context, store, child)=>Text(
                  store.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            //drop down menu
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

          ],
        ),
        ),
      ],
    )
    );
  }
}
import 'package:fisrt_app/components/my_receipt.dart';
import 'package:fisrt_app/models/store.dart';
import 'package:fisrt_app/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget{
  const DeliveryProgressPage ({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to db
  FirestoreService db= FirestoreService();

  @override
  void initState(){
    super.initState();

    // if we get to this age, submit order to firestore db
    String receipt = context.read<Store>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tu pedido está en progreso..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //cx bottom nav bar - Message / Call delivery driver
Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile  pic of driver
      Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,

      ),
      child: IconButton(
        onPressed: (){},
        icon: const Icon(Icons.person),
      ),
    ),
    const SizedBox(width: 10),

    // driver details
    Column(
      children: [
        Text(
          "Jairo Valero",
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.inversePrimary,
        ),
        ),
        Text(
            "Conductor",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary
          ),
        ),

      ],
    ),

    const Spacer(),


    Row(children: [
      // message buttom
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,

        ),
        child: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.message),
          color: Theme.of(context).colorScheme.primaryFixed,
        ),
      ),

      const SizedBox(width: 10),

      // call buttom
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,

        ),
        child: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.call),
          color: Colors.green,
        ),
      )

    ],)



],),
    );
}
}
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fisrt_app/components/my_button.dart';
import 'package:fisrt_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget{
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>{
  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;

  //User wants to pay
  void userTappedPay(){
    if (formkey.currentState!.validate()){
      //only show dialog if form is valid
      showDialog(
        context:context,
        builder: (context)=> AlertDialog(
          title: const Text("Confirmar pago "),
          content: SingleChildScrollView(
            child: ListBody(
              children:[
                Text("Número de tarjeta: $cardNumber"),
                Text("Fecha de expiracion: $expiryDate"),
                Text("Propietario: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions:[
            //cancel button
            TextButton(
              onPressed: ()=> Navigator.pop(context),
              child: const Text("cancelar"),
            ),

            //yes button
           TextButton(
             onPressed: () {
               Navigator.pop(context);
               Navigator.push (
                 context,
               MaterialPageRoute(
               builder: (context)=> DeliveryProgressPage(),
    ),
               );
    },
             child: const Text("si"),
           )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pagar"),
      ),
      body: Column(
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
           ),

          //credit card form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data){
                setState(() {
                  cardNumber=data.cardNumber;
                  expiryDate=data.expiryDate;
                  cardHolderName=data.cardHolderName;
                  cvvCode=data.cvvCode;
                });
              },
              formKey: formkey,
          ),
           const Spacer(),

          MyButton(
              onTap: userTappedPay,
              text:"Pagar ahora",
          ),

          const SizedBox(height:25),
        ],
      ),
    ) ;
  }
}
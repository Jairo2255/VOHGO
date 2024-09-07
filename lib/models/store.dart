import 'package:fisrt_app/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'products.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Store extends ChangeNotifier {
  //List of Products menu
  final List<Products> _menu = [
    //Sensors
    Products(
      name: "TSOP38238",
      description:
      "Sensor receptor infrarrojo (IR) que se utiliza para la recepción de señales IR modulado en una frecuencia de 38 kHz.",
      imagePath:"lib/images/Sensors/Sensors.png",
      price:4000.0,
      category:ProductCategory.Sensors,
      availableAddons:[
        Addon(name: "Jumpers macho-macho X10", price: 4000.0),
        Addon(name: "Jumpers macho-hembra X10", price: 4100.0),
        Addon(name: "Jumper hembra-hembra X10", price: 3900.0),
      ],
    ),
    Products(
      name: "HC-SR04",
      description:
      "El sensor HC-SR04 es un sensor ultrasónico que mide distancias con alta precisión utilizando ondas de sonido.",
      imagePath:"lib/images/Sensors/Sensors.png",
      price:4000,
      category:ProductCategory.Sensors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4000.0),
        Addon(name: "HC-SR04", price: 4100.0),
        Addon(name: "HC-SR03", price: 3900.0),
      ],
    ),
    Products(
      name: "LM35",
      description:
      " El sensor LM35 es un sensor de temperatura de alta precisión que proporciona una salida de voltaje linealmente proporcional a la temperatura en grados Celsius.",
      imagePath:"lib/images/Sensors/LM35.png",
      price:4000,
      category:ProductCategory.Sensors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Sensor Hall",
      description:
      "Este dispositivo detecta campos magnéticos y convierte esa información en una salida analógica proporcional a la intensidad del campo magnético que percibe.",
      imagePath:"lib/images/Sensors/Hall.png",
      price:3500,
      category:ProductCategory.Sensors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Sensor de nivel",
      description:
      "Es un dispositivo diseñado para medir la altura o nivel del agua en un contenedor y proporcionar una señal de salida analógica que es proporcional al nivel detectado.",
      imagePath:"lib/images/Sensors/Water_Level.png",
      price:2300,
      category:ProductCategory.Sensors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),

    // Capacitors
    Products(
      name: "Capacitor electrolitico 100uF",
      description:
      "Es especialmente útil en aplicaciones donde se requiere una alta capacidad de almacenamiento de energía.",
      imagePath:"lib/images/Capacitors/Capacitors.png",
      price:220.15,
      category:ProductCategory.Capacitors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Capacitor electrolitico 10uF",
      description:
      "Es especialmente útil en aplicaciones donde se requiere una alta capacidad de almacenamiento de energía.",
      imagePath:"lib/images/Capacitors/Capacitors.png",
      price:104.72,
      category:ProductCategory.Capacitors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Capacitor electrolitico 1uF",
      description:
      "Es especialmente útil en aplicaciones donde se requiere una alta capacidad de almacenamiento de energía.",
      imagePath:"lib/images/Capacitors/Capacitors.png",
      price:138.04,
      category:ProductCategory.Capacitors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Capacitor cerámico 22uF",
      description:
      "Es ampliamente utilizado en circuitos electrónicos debido a su tamaño compacto, alta fiabilidad y estabilidad.",
      imagePath:"lib/images/Capacitors/Ceramico.png",
      price:65.45,
      category:ProductCategory.Capacitors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Capacitor cerámico 5uF",
      description:
      "Es ampliamente utilizado en circuitos electrónicos debido a su tamaño compacto, alta fiabilidad y estabilidad.",
      imagePath:"lib/images/Capacitors/Ceramico.png",
      price:74.97,
      category:ProductCategory.Capacitors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),

    //IntegratedCircuit
    Products(
      name: "NOT",
      description:
      "Su función es invertir el estado lógico de su entrada.",
      imagePath:"lib/images/IntegratedCircuits/NOT.png",
      price:1181,
      category:ProductCategory.IntegratedCircuits,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "LM354",
      description:
      "es un componente electrónico integrado que amplifica la diferencia de voltaje entre dos entradas, una no inversora y una inversora.",
      imagePath:"lib/images/IntegratedCircuits/OPamp.png",
      price:1332.80,
      category:ProductCategory.IntegratedCircuits,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "LM555",
      description:
      "es un circuito integrado diseñado para funcionar como temporizador, generador de pulsos y oscilador",
      imagePath:"lib/images/IntegratedCircuits/LM555.png",
      price:1.000,
      category:ProductCategory.IntegratedCircuits,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "OR",
      description:
      "Su función es producir una salida alta (1) si al menos una de sus entradas es alta",
      imagePath:"lib/images/IntegratedCircuits/OR.png",
      price:2346,
      category:ProductCategory.IntegratedCircuits,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "AND",
      description:
      "Su función es producir una salida alta (1) solo si todas sus entradas son altas",
      imagePath:"lib/images/IntegratedCircuits/AND.png",
      price:1266,
      category:ProductCategory.IntegratedCircuits,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),

    // Resistors
    Products(
      name: "Potenciometro",
      description:
      "Es un tipo de resistor variable que se utiliza para ajustar la resistencia en un circuito de manera manual.",
      imagePath:"lib/images/Resistors/POT.png",
      price:2500,
      category:ProductCategory.Resistors,
      availableAddons:[
        Addon(name: "Jumpers macho-macho X10", price: 4000.0),
        Addon(name: "Jumpers macho-hembra X10", price: 4100.0),
        Addon(name: "Jumper hembra-hembra X10", price: 3900.0),
      ],
    ),
    Products(
      name: "Res 1K 1/4W",
      description:
      "es un componente electrónico diseñado para limitar la cantidad de corriente que pasa a través de un circuito, con una capacidad de disipación de potencia de 1/4 de vatio",
      imagePath:"lib/images/Resistors/Resistors.png",
      price:487.50,
      category:ProductCategory.Resistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Res 1K 1/2W",
      description:
      "es un componente electrónico diseñado para limitar la cantidad de corriente que pasa a través de un circuito, con una capacidad de disipación de potencia de 1/2 de vatio.",
      imagePath:"lib/images/Resistors/Resistors.png",
      price:183.26,
      category:ProductCategory.Resistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Res 1K 1W",
      description:
      "Es un componente electrónico diseñado para limitar la corriente en un circuito, con una capacidad de disipación de potencia de hasta 1 vatio",
      imagePath:"lib/images/Resistors/Resistors.png",
      price:152.60,
      category:ProductCategory.Resistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Res 1K 5W",
      description:
      "Es adecuada para aplicaciones que requieren una resistencia con capacidad para soportar corrientes más altas sin sobrecalentarse",
      imagePath:"lib/images/Resistors/Resistors.png",
      price:183.60,
      category:ProductCategory.Resistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),

    // Transistors
    Products(
      name: "TIP31C",
      description:
      "Es un transistor bipolar de unión (BJT) de tipo NPN, diseñado para aplicaciones de amplificación y conmutación en circuitos electrónicos",
      imagePath:"lib/images/Transistors/Transistors.png",
      price:1134.07,
      category:ProductCategory.Transistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "TIP32C",
      description:
      "Es un transistor bipolar de unión (BJT) de tipo PNP, utilizado en aplicaciones de amplificación y conmutación en circuitos electrónicos",
      imagePath:"lib/images/Transistors/TIP31.png",
      price:1000,
      category:ProductCategory.Transistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "Transistor MOSFET BS250",
      description:
      "Es un tipo de MOSFET de tipo P-Channel, utilizado en aplicaciones de conmutación y amplificación en circuitos electrónicos",
      imagePath:"lib/images/Transistors/TIP31.png",
      price:2008.09,
      category:ProductCategory.Transistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "TIP117C",
      description:
      "Es un transistor de potencia tipo NPN diseñado para aplicaciones de amplificación y conmutación en circuitos electrónicos.",
      imagePath:"lib/images/Transistors/TIP31.png",
      price:906.78,
      category:ProductCategory.Transistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),
    Products(
      name: "TIP120",
      description:
      "es un transistor bipolar de unión (BJT) tipo NPN, conocido por su capacidad para manejar altas corrientes y voltajes, lo que lo hace adecuado para aplicaciones de potencia y conmutación.",
      imagePath:"lib/images/Transistors/TIP31.png",
      price:1322.09,
      category:ProductCategory.Transistors,
      availableAddons:[
        Addon(name: "HC-SR05", price: 4.000),
        Addon(name: "HC-SR04", price: 4.100),
        Addon(name: "HC-SR03", price: 3.900),
      ],
    ),

  ];

  //User cart
  final List<CartItem> _cart=[];

  // delivery addres (wich user can change/update)
  String _deliveryAddress = 'Universidad Militar Nueva Granada';

  /*

  G E T T E R S

  */

List<Products> get menu => _menu;
List<CartItem> get cart=>_cart;
String get deliveryAddress => _deliveryAddress;

  /*

  O P E R A T I O N S

  */




// add to the car
void addToCart(Products products, List<Addon> selectedAddons){
  // see if there is a cart item already with the same product and select addons
  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //Check if there products items are the same
    bool isSameProduct = item.products == products;

    //Check if the list of selected addons are the same
    bool isSameAddons =
        ListEquality().equals(item.selectedAddons, selectedAddons);

    return isSameProduct && isSameAddons;
  });

  //if item already exist, increase it's quantity
  if (cartItem != null){
    cartItem.quantity++;
  }

  // otherwise, add a new cart item to the cart
  else{
    _cart.add(
        CartItem(
            products: products,
            selectedAddons: selectedAddons,
        ),
    );
  }
  notifyListeners();
}

// remove to the car
void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex!=-1){
    if(_cart[cartIndex].quantity>1){
      _cart[cartIndex].quantity--;
    } else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

// get total price of cart
double getTotalPrice(){
  double total=0.0;
  for(CartItem cartItem in _cart){
    double itemTotal=cartItem.products.price;

    for(Addon addon in cartItem.selectedAddons){
      itemTotal += addon.price;
    }
   total += itemTotal*cartItem.quantity;
  }
 return total;
}


//get total items in the cart
int getTotalItemCount(){
  int totalItemCount=0;

  for (CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
}

//clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}

//update delivery address
void updateDeliveryAddress(String newAddress){
  _deliveryAddress=newAddress;
  notifyListeners();
}
  /*

  H E L P E R S

  */

//generate a receipt
  String displayCartReceipt(){
    final recepeit = StringBuffer();
    recepeit.writeln("Este tu recibo");
    recepeit.writeln();

    //format the date to include up to seconds only
    String formattedDate= DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    recepeit.writeln(formattedDate);
    recepeit.writeln();
    recepeit.writeln("-------");

    for (final cartItem in _cart){
      recepeit.writeln("${cartItem.quantity} x ${cartItem.products.name} - ${_formatPrice(cartItem.products.price)}" );
      if (cartItem.selectedAddons.isNotEmpty){
        recepeit.writeln(" Adiciones: ${_formatAddons(cartItem.selectedAddons)}");
      }
      recepeit.writeln();
    }

    recepeit.writeln("-------");
    recepeit.writeln();
    recepeit.writeln("Total de insumos: ${getTotalItemCount()}");
    recepeit.writeln("Precio final: ${_formatPrice(getTotalPrice())}");
    recepeit.writeln();
    recepeit.writeln("Delivery to: $deliveryAddress");

    return recepeit.toString();

  }

// format double value into money
String _formatPrice(double price ) {
  return "\$${price.toStringAsFixed(2)}";
}

// format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)}  )")
        .join(", ");
  }
}
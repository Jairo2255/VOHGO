// Product item
class Products {
  final String name;              // ej: Transistor
  final String description;       // ej: BJT
  final String imagePath;         // ej: lib/images/Transistor
  final double price;             // ej: $ 500 COP
  final ProductCategory category; // ej: Transistor
  List<Addon> availableAddons;    // ej: [2N2222A]

  Products({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// Product categories
enum ProductCategory {
  Sensors,
  Resistors,
  Capacitors,
  Transistors,
  IntegratedCircuits,
}

// Product addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
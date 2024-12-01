void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double totalprice = 0.0;
  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      totalprice += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not menu ');
    }
  }
  print('Total: $totalprice');
}

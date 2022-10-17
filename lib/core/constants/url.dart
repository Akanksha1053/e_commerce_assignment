class Url {
  static String baseUrl =
      'https://plantecommerce-assignment-default-rtdb.firebaseio.com/Items/.json';
  static String cartUrl =
      'https://plantecommerce-assignment-default-rtdb.firebaseio.com/cart/.json';
  static String productUrl =
      'https://plantecommerce-assignment-default-rtdb.firebaseio.com/Items/$idOfItem.json';

  static get idOfItem => null;
}

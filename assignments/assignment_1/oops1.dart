// OOPs Assignment-

// To be solved in Dart, Java or C++

// 1. Create a class Product with two attributes- 1. productName String and price int.
// 2. Create an abstract class Category which has two methods- 1. getProducts and addProducts.
// 3. After that, create another class Cart which extends Category class. The cart must contain a list of Products. Initially this list is empty.
// 4. Override the methods from the Category class inside Cart. The getProducts method must return the current list of products in the cart.
// 5. Similarly, the addProduct method must add a Product to the existing list of products.
// 6. During execution, create an instance of Cart and print the list of products using the appropriate method.
// 7. After that, add two or three new products in the cart using the appropriate method and print the cart again.


void main() {
  Cart cart = Cart();

  print(cart.getProducts());
  cart.addProducts(Product(productName: "Pen", price: 20));

  cart.addProducts(Product(productName: "Pen", price: 20));

  cart.addProducts(Product(productName: "Pen", price: 20));
  print(cart.getProducts());
}

class Product {
  String? productName;
  int? price;

  Product({this.productName, this.price});

  @override
  toString() => "\n$productName $price";
}

abstract class Category {
  List<Product> getProducts();

  void addProducts(Product product);
}

class Cart extends Category {
  List<Product> listOfProducts = [];

  @override
  List<Product> getProducts() {
    return listOfProducts;
  }

  @override
  void addProducts(Product product) {
    listOfProducts.add(product);
  }
}

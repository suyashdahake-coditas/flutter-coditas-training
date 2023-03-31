import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.isFavourite = false,
    required this.imageUrl,
  });

  void _setFavValue(bool newValue){
    isFavourite=newValue;
    notifyListeners();
  }
  void toggleFavouriteStatus() async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = Uri.parse(
        'https://test-68ffe-default-rtdb.firebaseio.com/products/$id.json');
    try {
      final response = await http.patch(url,
          body: json.encode({
            'isFavourite': isFavourite,
          }));
      if(response.statusCode>=400){
        _setFavValue(oldStatus);
      }
    } catch (error) {
      isFavourite = oldStatus;
      notifyListeners();
    }
  }
}

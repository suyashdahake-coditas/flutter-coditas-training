class Food {
  final String id;
  final String itemName;
  final String content;
  bool inCart;
  final String imageUrl;

  Food({
    required this.itemName,
    required this.content,
    this.inCart = false,
    required this.imageUrl,
    required this.id,
  });
}

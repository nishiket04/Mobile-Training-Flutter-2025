class Cart{
  int product_id;
  String product_name;
  double price;
  int quantity;
  bool in_stock;

  Cart(this.product_id, this.product_name, this.price, this.quantity,this.in_stock);

  factory Cart.fromJson(Map<String, dynamic> data){
    final product_id = data['product_id'] as int;
    final product_name = data['product_name'] as String;
    final price = data['price'] as double;
    final quantity = data['quantity'] as int;
    final in_stock = data['in_stock'] as bool;
    return Cart(product_id, product_name, price, quantity, in_stock);
  }

  Map<String, dynamic> toJson() =>
      {
        'product_id': product_id,
        'product_name': product_name,
        'price': price,
        'quantity': quantity,
        'in_stock': in_stock,
      };
}
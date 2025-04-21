import 'package:shared_preferences/shared_preferences.dart';

class CartJson{
  static final _json = """[
  {
	"product_id": 101,
	"product_name": "Wireless Headphones",
	"price": 59.99,
	"quantity": 2,
	"in_stock": true
  },
  {
	"product_id": 102,
	"product_name": "Bluetooth Speaker",
	"price": 39.99,
	"quantity": 1,
	"in_stock": false
  },
  {
	"product_id": 103,
	"product_name": "Smartwatch",
	"price": 129.99,
	"quantity": 3,
	"in_stock": true
  },
  {
	"product_id": 104,
	"product_name": "USB-C Charger",
	"price": 19.99,
	"quantity": 5,
	"in_stock": true
  },
  {
	"product_id": 105,
	"product_name": "Noise Cancelling Earbuds",
	"price": 79.99,
	"quantity": 0,
	"in_stock": false
  },
  {
	"product_id": 106,
	"product_name": "Portable Power Bank",
	"price": 24.49,
	"quantity": 2,
	"in_stock": true
  },
  {
	"product_id": 107,
	"product_name": "Gaming Mouse",
	"price": 45.00,
	"quantity": 4,
	"in_stock": true
  },
  {
	"product_id": 108,
	"product_name": "Mechanical Keyboard",
	"price": 89.95,
	"quantity": 1,
	"in_stock": true
  },
  {
	"product_id": 109,
	"product_name": "4K Webcam",
	"price": 74.50,
	"quantity": 0,
	"in_stock": false
  },
  {
	"product_id": 110,
	"product_name": "LED Monitor Light Bar",
	"price": 32.00,
	"quantity": 6,
	"in_stock": true
  }
]
""";

  static Future<void> storeData() async{
    var pref = await SharedPreferences.getInstance();
    pref.setString("cart_data", _json);
  }

  static Future<String> getJson() async{
    var pref = await SharedPreferences.getInstance();
    var json = await pref.getString("cart_data");
    return json??"";
  }
}
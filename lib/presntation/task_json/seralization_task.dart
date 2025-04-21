import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';
import 'cart_json.dart';
import 'cart_widget.dart';

class SeralizationTask extends StatefulWidget {
  const SeralizationTask({super.key});

  @override
  State<StatefulWidget> createState() => _SeralizationTask();
}

class _SeralizationTask extends State<SeralizationTask> {
  late String json;
  late Iterable l;
  late List<Cart> cart;

  @override
  void initState() {
    super.initState();
    CartJson.getJson().then((value) {
      l = jsonDecode(value);
      setState(() {
        cart = List<Cart>.from(l.map((model) => Cart.fromJson(model)));
      });
    });
  }

  Future<void> _storeUpdatedJson(String _json) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("cart_data", _json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _buildJsonDialog,
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(3),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CartWidget(cart[index]);
        },
      ),
    );
  }

  void _buildJsonDialog() {
    _storeUpdatedJson(jsonEncode(cart));
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Text(
              jsonEncode(cart).replaceAll("},", "},\n").replaceAll("{", "\n{"),
            ),
          ),
        );
      },
    );
  }
}

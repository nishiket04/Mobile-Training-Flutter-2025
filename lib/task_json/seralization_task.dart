import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/task_json/cart.dart';
import 'package:flutter_task/task_json/cart_json.dart';
import 'package:flutter_task/task_json/cart_widget.dart';

class SeralizationTask extends StatefulWidget {
  const SeralizationTask({super.key});

  @override
  State<StatefulWidget> createState() => _SeralizationTask();
}

class _SeralizationTask extends State<SeralizationTask> {
  static Iterable l = jsonDecode(CartJson.json);
  List<Cart> cart = List<Cart>.from(l.map((model) => Cart.fromJson(model)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [TextButton(onPressed: _buildJsonDialog, child: Icon(Icons.shopping_cart_outlined))],),
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

  void _buildJsonDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Text(
              jsonEncode(
                cart,
              ).replaceAll("},", "},\n").replaceAll("{", "\n{"),
            ),
          ),
        );
      },
    );
  }
}

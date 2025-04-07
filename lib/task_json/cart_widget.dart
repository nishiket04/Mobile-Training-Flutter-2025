import 'package:flutter/material.dart';
import 'cart.dart';

class CartWidget extends StatefulWidget {
  final Cart cart;

  const CartWidget(this.cart);

  @override
  State<StatefulWidget> createState() => _CartWidget(cart);
}

class _CartWidget extends State<CartWidget> {
  final Cart cart;

  _CartWidget(this.cart);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(cart.product_name),
          _buildItemLogo(),
          Text("Price: ${cart.price}\$"),
          _buildQuantityChip(),
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildItemLogo() {
    return CircleAvatar(child: Text(cart.product_name[0]));
  }

  Widget _buildQuantityChip() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black87),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAddQuantityButton(),
          Text(cart.quantity.toString()),
          _buildRemoveQuantityButton(),
        ],
      ),
    );
  }

  Widget _buildAddQuantityButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          cart.quantity++;
        });
      },
      child: Icon(Icons.add),
    );
  }

  Widget _buildRemoveQuantityButton() {
    return TextButton(
      onPressed: () {
        if (cart.quantity == 0) {
          return;
        }
        setState(() {
          cart.quantity--;
        });
      },
      child: Icon(Icons.remove),
    );
  }

  Widget _buildBuyButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          cart.in_stock ? Colors.white : Colors.grey,
        ),
      ),
      onPressed: cart.in_stock ? _showSnackBar : () {},
      child: Text(
        cart.in_stock ? "Buy" : "Out of Stock",
        style: TextStyle(
          color: cart.in_stock ? Theme.of(context).primaryColor : Colors.white,
        ),
      ),
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Successfully Purchased")));
  }
}

import 'package:flutter/material.dart';

class Style extends StatefulWidget {
  const Style({super.key});

  @override
  State<StatefulWidget> createState() => _Style();
}

class _Style extends State<Style> {
  final List<bool> _cart = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildBody()));
  }

  // Build's body for scaffold
  Widget _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: _cart.length,
      itemBuilder: (context, index) {
        return _buildCard(index);
      },
    );
  }

  // Item card Function
  Widget _buildCard(int index) {
    return Card(
      elevation: 10,
      child: Column(
        spacing: 2,
        children: [_image(index), _priceAndCart(index), _buyButton()],
      ),
    );
  }

  // Item Image Function
  Widget _image(int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.bottomLeft,
      height: 143,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage("assets/images/anime.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Text("item $index", style: TextStyle(color: Colors.white)),
    );
  }

  // Item Price Function
  Widget _priceAndCart(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Price: \$${index + 1}"),
          Switch(
            trackColor: WidgetStatePropertyAll(_cart[index]?Colors.green:Colors.red),
            thumbIcon: WidgetStateProperty.all(
              Icon(
                _cart[index] ? Icons.shopping_cart : Icons.remove_shopping_cart,
              ),
            ),
            value: _cart[index],
            onChanged: (value) {
              setState(() {
                _cart[index] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Buy Button Function
  Widget _buyButton() {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber)),
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Then Buy it!!!")));
      },
      child: Text("Buy", style: TextStyle(color: Colors.black87)),
    );
  }

  // End
}

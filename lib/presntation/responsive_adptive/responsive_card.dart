import 'package:flutter/material.dart';

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({
    super.key,
    required this.isLarge,
    required this.title,
    required this.image,
    required this.description,
  });

  final bool isLarge;
  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      margin: EdgeInsets.all(15),
      child: SizedBox(
        width:  double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextStyle(fontSize: 50)),
                ClipOval(
                  child: Image(
                    image: AssetImage(image),
                    height: constraints.maxWidth * 0.3,
                    width: constraints.maxWidth * 0.3,
                    fit: BoxFit.fill,
                  ),
                ),
                Visibility(
                  visible: isLarge,
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

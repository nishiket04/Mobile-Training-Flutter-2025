import 'package:flutter/material.dart';
import 'package:flutter_task/responsive_adptive/responsive_card.dart';

class CardResonsive extends StatelessWidget {
  const CardResonsive({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLargeScreen = screenWidth >= 900 || screenHeight >= 900;
    return Scaffold(
      body: ResponsiveCard(
        isLarge: isLargeScreen,
        title: "Item",
        image: "assets/images/restaurent_food.jpg",
        description: "This is Description",
      ),
    );
  }
}

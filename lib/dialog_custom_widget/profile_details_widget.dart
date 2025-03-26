import 'package:flutter/cupertino.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard(
      {required this.image, required this.height, required this.width, required this.onTap, required this.color,required this.name,required this.bio, required this.onSwap});
  final VoidCallback onTap;
  final Function(DragUpdateDetails) onSwap;
  final String image;
  final String name;
  final String bio;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onPanUpdate: onSwap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(name),
            Text("Bio: "+bio,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
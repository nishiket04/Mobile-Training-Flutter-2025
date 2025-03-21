import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageFonts extends StatefulWidget{
  const ImageFonts({super.key});
  @override
  State<StatefulWidget> createState() => _ImageFonts();
}

class _ImageFonts extends State<ImageFonts>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset("assets/images/anime.jpg",fit: BoxFit.fill,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("Hello",style: TextStyle(fontFamily: "assets/fonts/Tektur-Medium.ttf",color: Colors.black,fontSize: 50.0),textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }

}
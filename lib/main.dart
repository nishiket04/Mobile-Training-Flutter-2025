import 'package:flutter/material.dart';
import 'package:flutter_task/images_fonts/images_fonts_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {"/imageFontsView": (context) => const ImageFonts()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/imageFontsView');
                },
                child: Text("Image And Fonts Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

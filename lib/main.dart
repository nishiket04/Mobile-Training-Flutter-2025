import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task/presntation/Cupertino/cupertino_task.dart';
import 'package:flutter_task/presntation/animation/animation_task.dart';
import 'package:flutter_task/presntation/app_life_cyle/app_life_cycle.dart';
import 'package:flutter_task/presntation/custom_paint/custom_paint.dart';
import 'package:flutter_task/presntation/dialog_custom_widget/custom_widget_task.dart';
import 'package:flutter_task/presntation/images_fonts/images_fonts_task.dart';
import 'package:flutter_task/presntation/isolates/isolates.dart';
import 'package:flutter_task/presntation/list_view_grid_view/ListViewGridView.dart';
import 'package:flutter_task/presntation/material_widget/material_widget.dart';
import 'package:flutter_task/presntation/navigation/navigation.dart';
import 'package:flutter_task/presntation/responsive_adptive/task_responsive.dart';
import 'package:flutter_task/presntation/sliver/sliver.dart';
import 'package:flutter_task/presntation/sqlite/note_model.dart';
import 'package:flutter_task/presntation/sqlite/notes.dart';
import 'package:flutter_task/presntation/strems/strems.dart';
import 'package:flutter_task/presntation/style/style.dart';
import 'package:flutter_task/presntation/task_json/cart_json.dart';
import 'package:flutter_task/presntation/task_json/seralization_task.dart';
import 'package:flutter_task/presntation/text_filed_form/text_field_form.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.openBox<NoteModel>('notes');
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
      routes: {
        "/": (context) => const MyHomePage(title: "Flutter Demo Home Page"),
        "/imageFontsView": (context) => const ImageFonts(),
        "/materialWidgetView": (context) => const MaterialWidget(),
        "/cupertinoView": (context) => const Cupertino(),
        "/customWidgetView": (context) => const CustomWidgetTask(),
        "/textFiledAndFormView": (context) => const TextFieldAndForm(),
        "/listViewGridView": (context) => const ListViewGridView(),
        "/navigationView": (context) => const Navigation(),
        "/routePage": (context) => const RoutePage(),
        "/styleView": (context) => const Style(),
        "/stremsView": (context) => const StremsTask(),
        "/isolatesView": (context) => const IsolatesTask(),
        "/animationView": (context) => const AnimationTask(),
        "/jsonView": (context) => const SeralizationTask(),
        "/customPaintView": (context) => const CustomPaintTask(),
        "/sliverView": (context) => const SliverTask(),
        "/appLifeCycleView": (context) => const AppLifeCycleTask(),
        "/responsiveView": (context) => const Responsive(),
        "/sqliteView": (context) => const Notes(),
      },
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
  void initState() {
    super.initState();
    CartJson.storeData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/materialWidgetView');
                  },
                  child: Text("Material Widget Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cupertinoView');
                  },
                  child: Text("Cupertino Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/customWidgetView');
                  },
                  child: Text("Custom Widget Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/textFiledAndFormView');
                  },
                  child: Text("Text Filed and Form Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/listViewGridView');
                  },
                  child: Text("List View Grid View Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigationView');
                  },
                  child: Text("Navigation Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/styleView');
                  },
                  child: Text("Style Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/stremsView');
                  },
                  child: Text("Streams Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/isolatesView');
                  },
                  child: Text("Isolates Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/animationView');
                  },
                  child: Text("Animation Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/jsonView');
                  },
                  child: Text("Json Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/customPaintView');
                  },
                  child: Text("Custom Paint Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sliverView');
                  },
                  child: Text("Sliver Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/appLifeCycleView');
                  },
                  child: Text("App Life Cycle Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/responsiveView');
                  },
                  child: Text("Responsive Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sqliteView');
                  },
                  child: Text("Sqlite Task", textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

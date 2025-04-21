import 'package:flutter/material.dart';

class CustomPaintTask extends StatefulWidget {
  const CustomPaintTask({super.key});

  @override
  State<StatefulWidget> createState() => _CustomPaintTask();
}

class _CustomPaintTask extends State<CustomPaintTask> {
  double? _tapX;
  int? _tappedIconIndex = 2;

  void _storePosition(TapDownDetails details,int index) {
    setState(() {
      _tapX = details.globalPosition.dx;
      _tappedIconIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Text("Custom paint task")),
      bottomNavigationBar: CustomPaint(
        painter: BottomNavigationPainter(centerX: _tapX),
        child: SizedBox(
          height: 100,
          width: 720,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(0,Icons.add),
              _buildIcon(1,Icons.account_circle),
              _buildIcon(2,Icons.access_alarm),
              _buildIcon(3,Icons.ac_unit_outlined),
              _buildIcon(4,Icons.access_time_filled),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index,IconData icon){
    if(_tappedIconIndex != index){
      return GestureDetector(onTapDown:(details) => _storePosition(details, index),child: Icon(icon));
    }
    else{
      return SizedBox(
      height: 56,
      child: Column(children: [Icon(icon)]),
    );
    }
  }
}

class BottomNavigationPainter extends CustomPainter {
  final double? centerX;

  BottomNavigationPainter({this.centerX});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill
          ..strokeWidth = 10;

    final path = Path();
    final w = size.width;
    final h = size.height;
    final center = centerX ?? w / 2;

    path.moveTo(0, 30);
    path.lineTo(center - 60, 30);
    path.quadraticBezierTo(center - 40, 30, center - 30, h / 5 + 30);
    path.quadraticBezierTo(center, h - h / 5 + 8, center + 27, h / 5 + 30);
    path.quadraticBezierTo(center + 38, 30, center + 50, 30);
    path.lineTo(w, 30);
    path.lineTo(w, 100);
    path.lineTo(0, 100);
    path.close();

    canvas.drawCircle(Offset(center, 32), 25, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant BottomNavigationPainter oldDelegate) =>
      oldDelegate.centerX != centerX;
}
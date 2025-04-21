import 'package:flutter/material.dart';

class SliverTask extends StatefulWidget {
  const SliverTask({super.key});

  @override
  State<StatefulWidget> createState() => _SliverTask();
}

class _SliverTask extends State<SliverTask> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 10;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _buildAppBar(),
            _buildCardList(),
            _buildReadyToHireBar(),
            _buildItemList(),
          ],
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  Widget _buildReadyToHireBar() {
    return SliverPersistentHeader(pinned: true, delegate: _ReadyToHire());
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _count++;
        });
      },
      child: Icon(Icons.add),
    );
  }

  Widget _buildItemList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('List Item $index')),
        childCount: _count,
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar.large(
      stretch: true,
      expandedHeight: 200,
      leading: _buildLogo(),
      actionsPadding: EdgeInsets.all(10),
      title: _buildSearchBar(),
      titleSpacing: 10,
      actions: [
        Icon(Icons.notifications, color: Colors.white),
        SizedBox.fromSize(size: Size(10, 0)),
        ClipOval(child: Image(image: AssetImage("assets/images/usa_flag.png"))),
      ],
      flexibleSpace: _buildSpaceBar(),
      floating: true,
      pinned: true,
    );
  }

  Widget _buildSpaceBar() {
    return FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [_buildBGImage(), _buildGradiant(), _buildAppBarContent()],
      ),
    );
  }

  Widget _buildBGImage() {
    return Image(
      image: AssetImage("assets/images/restaurent_food.jpg"),
      fit: BoxFit.fill,
    );
  }

  Widget _buildGradiant() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.transparent],
          transform: GradientRotation(30),
        ),
      ),
    );
  }

  Widget _buildCardList() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _card(index);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 20,
        ),
      ),
    );
  }

  Widget _card(int index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$index", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Image(image: AssetImage("assets/images/w_logo.png")),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        prefixIcon: Icon(Icons.search, color: Colors.white),
      ),
    );
  }

  Widget _buildAppBarContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 5,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Good Morning! Nishiket👋",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Do You Need Help?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: _buildSearchBar(),
          ),
        ),
      ],
    );
  }
}

class _ReadyToHire extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Ready To Hire?"),
          ElevatedButton(onPressed: () {}, child: Text("Get Started?")),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

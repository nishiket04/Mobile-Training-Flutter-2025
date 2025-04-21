import 'package:flutter/material.dart';

class AnimationTask extends StatefulWidget {
  const AnimationTask({super.key});

  @override
  State<StatefulWidget> createState() => _AnimationTask();
}

class _AnimationTask extends State<AnimationTask>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['RDJ', 'Tommy', 'Jarvis'];
  final _itemController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _addItem() {
    final newIndex = _items.length;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if(value!=null&&value.isEmpty){
                 return "Enter Item Name";
                }
                return null;
              },
              controller: _itemController,
              decoration: InputDecoration(hintText: "Enter Name"),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  _items.add(_itemController.text);
                  _listKey.currentState?.insertItem(newIndex);
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, index, animation),
    );
  }

  Widget _buildItem(String item, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailScreen(item: item)),
          );
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: ListTile(
            leading: Hero(
              tag: 'hero-$item',
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(item[0]),
              ),
            ),
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeItem(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], index, animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;

  const DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'hero-$item',
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blue,
            child: Text(
              item[0],
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

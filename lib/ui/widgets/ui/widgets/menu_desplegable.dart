
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDesplegable extends StatefulWidget{
  final List<String> items;
  late final String selectedItem;

  MenuDesplegable(this.items, this.selectedItem);

  @override
  State<StatefulWidget> createState() => _MenuDesplegable();

}

class _MenuDesplegable extends State<MenuDesplegable>{
  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
        value: widget.selectedItem,
        items: widget.items.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item,style: TextStyle(fontSize: 18)),
        )).toList(),
        onChanged: (item) => setState(() => widget.selectedItem = item!)
    );
  }
}
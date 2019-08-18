import 'package:flutter/material.dart';

import 'package:gomoku_ai/widgets/switcher/barItem.dart';

class AnimatedBar extends StatefulWidget {

  final List<BarItem> barItems;
  AnimatedBar({this.barItems});

  @override
  _AnimatedBarState createState() => _AnimatedBarState();
}

class _AnimatedBarState extends State<AnimatedBar> with TickerProviderStateMixin{

  int selectedPlayer = 0;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 16.0, top: 8.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildBarItems(),
        ),
      ),
    );
  }
  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();


    for (int i=0; i<widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedPlayer==i;
      _barItems.add(InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: (){
          setState(() {
            selectedPlayer = i;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? item.color.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                item.iconData,
                color: isSelected ? item.color: Colors.black,
                size: 28.0,
              ),
              SizedBox(width: 10.0,),
              AnimatedSize(
                vsync: this,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Text(
                  isSelected? item.text : "",
                  style: TextStyle(
                    color: item.color, fontWeight: FontWeight.w600, fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return _barItems;
  }
}

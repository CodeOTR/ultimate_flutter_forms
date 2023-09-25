import 'package:flutter/material.dart';

class CircleButtonsWidget extends StatefulWidget {
  final ValueChanged<int>? onButtonPressed;

  const CircleButtonsWidget({
    Key? key,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  _CircleButtonsWidgetState createState() => _CircleButtonsWidgetState();
}

class _CircleButtonsWidgetState extends State<CircleButtonsWidget> {
  int? _selectedButton;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5 buttons in a row
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        bool isSelected = _selectedButton == index + 1;
        return ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedButton = index + 1;
            });
            if (widget.onButtonPressed != null) {
              widget.onButtonPressed!(_selectedButton!);
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            primary: isSelected ? Colors.blue : Colors.transparent,
            onPrimary: isSelected ? Colors.white : Colors.blue,
            padding: const EdgeInsets.all(20.0),
            side: BorderSide.none,
          ),
          child: Text('${index + 1}'),
        );
      },
    );
  }
}

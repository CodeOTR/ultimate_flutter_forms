import 'package:flutter/material.dart';

class EmojiPicker extends StatefulWidget {
  final ValueChanged<String>? onEmojiSelected;

  const EmojiPicker({Key? key, this.onEmojiSelected}) : super(key: key);

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  // A basic list of emojis. You can expand this list as needed.
  final List<String> _emojis = [
    '😀', '😃', '😄', '😁', '😆', '😅', '😂', '🤣', '😊', '😇',
    '🙂', '🙃', '😉', '😌', '😍', '🥰', '😘', '😗', '😙', '😚',
    // ... add more emojis as needed
  ];

  int? _selectedEmojiIndex;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5 emojis per row
      ),
      itemCount: _emojis.length,
      itemBuilder: (context, index) {
        bool isSelected = _selectedEmojiIndex == index;

        return Material(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedEmojiIndex = index;
              });
              if (widget.onEmojiSelected != null) {
                widget.onEmojiSelected!(_emojis[index]);
              }
            },
            child: Center(
              child: Transform(
                transform: Matrix4.identity()
                  ..scale(isSelected ? 1.5 : 1.0)
                  ..rotateZ(isSelected ? 0.1 : 0), // Rotate by 0.1 radians when selected
                alignment: Alignment.center,
                child: Text(
                  _emojis[index],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

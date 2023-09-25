import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maxStars;
  final ValueChanged<int>? onRatingChanged;

  const StarRating({
    Key? key,
    this.maxStars = 5,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        return Flexible(
          child: IconButton(
            icon: Icon(
              index < _currentRating ? Icons.star : Icons.star_border,
              color: Colors.yellow[700],
            ),
            onPressed: () {
              setState(() {
                _currentRating = index + 1;
              });
              if (widget.onRatingChanged != null) {
                widget.onRatingChanged!(_currentRating);
              }
            },
          ),
        );
      }),
    );
  }
}

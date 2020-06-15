import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ClayFlipCard extends StatelessWidget {
  const ClayFlipCard({
    Key key,
    this.itemImage,
    this.child,
  }) : super(key: key);

  final String itemImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: ContainerResponsive(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 280,
        width: 280,
        child: Image.network(
          itemImage,
          fit: BoxFit.cover,
        ),
      ),
      back: ContainerResponsive(
        padding: EdgeInsets.only(left: 50),
        height: 550,
        width: 1000,
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
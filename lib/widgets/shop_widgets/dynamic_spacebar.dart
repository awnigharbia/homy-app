import 'package:flutter/material.dart';

class DynamicFlexibleSpaceBarTitle extends StatefulWidget {
  /// this widget changing bottom padding of title according scrollposition of flexible space

  /// child which will be displayed as title
  @required
  final Widget child;

  DynamicFlexibleSpaceBarTitle({this.child});

  @override
  State<StatefulWidget> createState() => _DynamicFlexibleSpaceBarTitleState();
}

class _DynamicFlexibleSpaceBarTitleState
    extends State<DynamicFlexibleSpaceBarTitle> {
  ScrollPosition _position;
  double _opacity = 16;

  /// default padding

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _removeListener();
    _addListener();
    super.didChangeDependencies();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() => _position?.removeListener(_positionListener);

  void _positionListener() {
    /// when scroll position changes widget will be rebuilt
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType();
    setState(() => _opacity = getPadding(settings.minExtent.toInt(),
        settings.maxExtent.toInt(), settings.currentExtent.toInt()));
  }

  double getPadding(int minExtent, int maxExtent, int currentExtent) {
    double onePaddingExtent = (maxExtent - minExtent) / 17;

    /// onePaddingExtent stands for 1 logical pixel of padding, 17 = count of numbers in range from 0 to 16
    /// when currentExtent changes the padding smoothly change
    if (currentExtent >= minExtent &&
        currentExtent <= minExtent + (1 * onePaddingExtent))
      return 0;
    else if (currentExtent > minExtent + (1 * onePaddingExtent) &&
        currentExtent <= minExtent + (2 * onePaddingExtent))
      return 0.1;
    else if (currentExtent > minExtent + (2 * onePaddingExtent) &&
        currentExtent <= minExtent + (3 * onePaddingExtent))
      return 0.2;
    else if (currentExtent > minExtent + (3 * onePaddingExtent) &&
        currentExtent <= minExtent + (4 * onePaddingExtent))
      return 0.3;
    else if (currentExtent > minExtent + (4 * onePaddingExtent) &&
        currentExtent <= minExtent + (5 * onePaddingExtent))
      return 0.4;
    else if (currentExtent > minExtent + (5 * onePaddingExtent) &&
        currentExtent <= minExtent + (6 * onePaddingExtent))
      return 0.5;
    else if (currentExtent > minExtent + (6 * onePaddingExtent) &&
        currentExtent <= minExtent + (7 * onePaddingExtent))
      return 0.6;
    else if (currentExtent > minExtent + (7 * onePaddingExtent) &&
        currentExtent <= minExtent + (8 * onePaddingExtent))
      return 0.7;
    else if (currentExtent > minExtent + (8 * onePaddingExtent) &&
        currentExtent <= minExtent + (9 * onePaddingExtent))
      return 0.8;
    else if (currentExtent > minExtent + (9 * onePaddingExtent) &&
        currentExtent <= minExtent + (10 * onePaddingExtent))
      return 0.9;
    else if (currentExtent > minExtent + (10 * onePaddingExtent) &&
        currentExtent <= minExtent + (11 * onePaddingExtent))
      return 1;
    else if (currentExtent > minExtent + (11 * onePaddingExtent) &&
        currentExtent <= minExtent + (12 * onePaddingExtent))
      return 1;
    else if (currentExtent > minExtent + (12 * onePaddingExtent) &&
        currentExtent <= minExtent + (13 * onePaddingExtent))
      return 1;
    else if (currentExtent > minExtent + (13 * onePaddingExtent) &&
        currentExtent <= minExtent + (14 * onePaddingExtent))
      return 1;
    else if (currentExtent > minExtent + (14 * onePaddingExtent) &&
        currentExtent <= minExtent + (15 * onePaddingExtent))
      return 1;
    else if (currentExtent > minExtent + (15 * onePaddingExtent) &&
        currentExtent <= minExtent + (16 * onePaddingExtent))
      return 1;
    else if (currentExtent > minExtent + (16 * onePaddingExtent) &&
        currentExtent <= minExtent + (17 * onePaddingExtent))
      return 1;
    else
      return 1;
  }

  @override
  Widget build(BuildContext context) =>
      Opacity(opacity: _opacity, child: widget.child);
}
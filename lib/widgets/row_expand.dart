import 'package:flutter/material.dart';

/// ROW EXPAND WIDGET
/// Stateful widget, which when tapped, opens more details.
/// Those details are specified in the [child] variable.
class RowExpand extends StatefulWidget {
  final Widget child;

  RowExpand(this.child);

  @override
  _RowExpandState createState() => _RowExpandState();
}

class _RowExpandState extends State<RowExpand> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return _isHide
        ? Tooltip(
            message: 'More details',
            child: InkResponse(
              child: Icon(
                Icons.expand_more,
                color: Theme.of(context).textTheme.caption.color,
                size: 27.0,
              ),
              onTap: () => setState(() => _isHide = false),
            ),
          )
        : widget.child;
  }
}

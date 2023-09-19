import 'package:flutter/material.dart';

/// Go back in the history
pop(BuildContext context) {
  NavigatorState nav = Navigator.of(context);
  if (!nav.canPop()) return;
  nav.pop();
}

/// Open a page
push(BuildContext context, Widget page, {replace = false}) {
  NavigatorState nav = Navigator.of(context);

  MaterialPageRoute route =
      MaterialPageRoute(builder: (BuildContext context) => page);
  replace ? nav.pushReplacement(route) : nav.push(route);
}

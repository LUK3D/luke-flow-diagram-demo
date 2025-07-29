import 'package:go_router/go_router.dart';
import 'package:luke_flow_diagram_demo/demo.dart';

import 'empty_canvas.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => DemoComponent()),
    GoRoute(path: "/empty", builder: (context, state) => EmptyCanvas()),
  ],
);

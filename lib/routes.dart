import 'package:go_router/go_router.dart';
import 'package:luke_flow_diagram_demo/adding_nodes.dart';
import 'package:luke_flow_diagram_demo/demo.dart';

import 'empty_canvas.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => DemoComponent()),
    GoRoute(path: "/empty", builder: (context, state) => EmptyCanvas()),
    GoRoute(path: "/adding-nodes", builder: (context, state) => AddingNodes()),
  ],
);

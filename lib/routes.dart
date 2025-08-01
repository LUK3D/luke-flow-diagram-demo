import 'package:go_router/go_router.dart';
import 'package:luke_flow_diagram_demo/adding_nodes.dart';
import 'package:luke_flow_diagram_demo/animated_edges.dart';
import 'package:luke_flow_diagram_demo/connections.dart';
import 'package:luke_flow_diagram_demo/custom_canvas.dart';
import 'package:luke_flow_diagram_demo/custom_canvas_2.dart';
import 'package:luke_flow_diagram_demo/custom_sockets.dart';
import 'package:luke_flow_diagram_demo/demo.dart';
import 'package:luke_flow_diagram_demo/dynamic_nodes.dart';

import 'empty_canvas.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => DemoComponent()),
    GoRoute(path: "/empty", builder: (context, state) => EmptyCanvas()),
    GoRoute(path: "/adding-nodes", builder: (context, state) => AddingNodes()),
    GoRoute(
      path: "/custom-canvas",
      builder: (context, state) => CustomCanvas(),
    ),
    GoRoute(
      path: "/custom-canvas-2",
      builder: (context, state) => CustomCanvas2(),
    ),
    GoRoute(
      path: "/dynamic-nodes",
      builder: (context, state) => DynamicNodes(),
    ),
    GoRoute(
      path: "/custom-sockets",
      builder: (context, state) => CustomSockets(),
    ),
    GoRoute(path: "/connections", builder: (context, state) => Connections()),
    GoRoute(
      path: "/animated-edges",
      builder: (context, state) => AnimatedEdges(),
    ),
  ],
);

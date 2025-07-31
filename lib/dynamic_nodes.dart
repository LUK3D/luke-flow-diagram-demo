import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';

class DynamicNodes extends StatefulWidget {
  const DynamicNodes({super.key});

  @override
  State<DynamicNodes> createState() => _DynamicNodesState();
}

class _DynamicNodesState extends State<DynamicNodes> {
  final controller = LukeFlowCanvasController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      addNode();
    });
  }

  void addNode() {
    final centerPosition = controller.viewController.viewportCenter;
    if (centerPosition != null) {
      controller.addNodes([
        NodeModel(position: Vector2.fromOffset(centerPosition)),
        NodeModel(
          position: Vector2.fromOffset(centerPosition).add(Vector2(100, -120)),
        ),
      ]);
      controller.viewController.center();
    }
  }

  bool isNodeConnceted(NodeModel node) {
    // Check if the node has any connections
    return controller.connections.where((connection) {
      return connection.source.nodeId == node.id;
    }).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LukeFlowCanvas(
        controller: controller,
        nodeBuilder: (node) {
          final isConnceted = isNodeConnceted(node);
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              color: isConnceted ? Colors.amber : Colors.black,
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  children: [
                    Text(
                      "This is a node",
                      style: TextStyle(color: Colors.white),
                    ),
                    if (isConnceted)
                      Text(
                        "This node is connected!!",
                        style: TextStyle(color: Colors.white),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

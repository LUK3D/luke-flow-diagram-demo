import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';

class AddingNodes extends StatefulWidget {
  const AddingNodes({super.key});

  @override
  State<AddingNodes> createState() => _AddingNodesState();
}

class _AddingNodesState extends State<AddingNodes> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LukeFlowCanvas(
        nodes: [],
        nodeBuilder: (node) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: Column(
                  children: [
                    Text(
                      "🤓",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      "This is a node",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        controller: controller,
      ),
    );
  }
}

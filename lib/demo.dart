import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';

class DemoComponent extends StatefulWidget {
  const DemoComponent({super.key});

  @override
  State<DemoComponent> createState() => _DemoComponentState();
}

class _DemoComponentState extends State<DemoComponent> {
  final controller = LukeFlowCanvasController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      addNode();
    });
  }

  void addNode() {
    final centerPosition = controller.viewController.viewportCenter;
    if (centerPosition != null) {
      controller.addNodes([
        NodeModel(position: Vector2.fromOffset(centerPosition)),
      ]);
      controller.viewController.center();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 15,
          children: [
            Text("Luke Flow Diagram Demo", style: TextStyle(fontSize: 20)),
            TextButton(onPressed: addNode, child: Text("Add Node")),
          ],
        ),
      ),
      body: LukeFlowCanvas(
        nodes: [],
        nodeBuilder: (node) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Row(
                  children: [
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

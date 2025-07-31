import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';

class CustomSockets extends StatefulWidget {
  const CustomSockets({super.key});

  @override
  State<CustomSockets> createState() => _CustomSocketsState();
}

class _CustomSocketsState extends State<CustomSockets> {
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
        NodeModel(
          position: Vector2.fromOffset(centerPosition).add(Vector2(100, -100)),
        ),
        NodeModel(
          position: Vector2.fromOffset(centerPosition).add(Vector2(-300, -100)),
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
        socketHeight: 50,
        socketWidth: 50,
        socketBuilder: (node, socket) {
          return Container(
            key: controller.getOrCreateSocketKey(socket.id),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                socket.type == NodeSocketType.input ? 'IN' : 'OUT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
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

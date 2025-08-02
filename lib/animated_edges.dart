import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';

class AnimatedEdges extends StatefulWidget {
  const AnimatedEdges({super.key});

  @override
  State<AnimatedEdges> createState() => _AnimatedEdgesState();
}

class _AnimatedEdgesState extends State<AnimatedEdges> {
  final controller = LukeFlowCanvasController();
  Vector2 mousePosition = Vector2.zero;

  void addNode() {
    controller.addNodes([NodeModel(position: mousePosition)]);
  }

  void animateEdges() {
    controller.setConnections(
      controller.connections
          .map((c) => c.copyWith(isAnimated: true, animationSpeed: 1))
          .toList(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C3241),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(onPressed: animateEdges, child: Text("Animate")),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: addNode,
              child: LukeFlowCanvas(
                onMouseMove: (position) {
                  setState(() {
                    mousePosition = position;
                  });
                },
                socketBuilder: (node, socket) {
                  return Container(
                    key: controller.getOrCreateSocketKey(socket.id),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 171, 22, 72),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.pink, width: 3),
                    ),
                  );
                },
                controller: controller,
                nodeBuilder: (node) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text("Node ${node.id}"),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

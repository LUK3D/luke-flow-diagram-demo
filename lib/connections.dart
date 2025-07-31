import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';
import 'package:luke_flow_diagram/widgets/edges/bezier.dart';
import 'package:luke_flow_diagram/widgets/edges/step.dart';

class Connections extends StatefulWidget {
  const Connections({super.key});

  @override
  State<Connections> createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections> {
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
          position: Vector2.fromOffset(centerPosition).add(Vector2(100, 100)),
        ),
        NodeModel(
          position: Vector2.fromOffset(centerPosition).add(Vector2(-300, -200)),
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
                      "An awesome Node",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        controller: controller,
        edgeBuilder: (source, target, edgeConnection) {
          if (edgeConnection.source.type == NodeSocketType.input) {
            return LukeEdgePainter(
              source: source,
              target: target,
              isDashed: true,
              color: Colors.blue,
              strokeWidth: 4,
            );
          }
          return LukeStepEdgePainter(
            source: source,
            target: target,
            isDashed: true,
            color: Colors.amber,
            strokeWidth: 6,
            cornerRadius: 40,
            dashOffset: 1,
            dashSpace: 12,
          );
        },
      ),
    );
  }
}

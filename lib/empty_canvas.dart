import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';

class EmptyCanvas extends StatelessWidget {
  const EmptyCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LukeFlowCanvasController();
    return LukeFlowCanvas(
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
                  Text("This is a node", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        );
      },
      controller: controller,
    );
  }
}

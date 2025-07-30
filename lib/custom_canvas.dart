import 'package:flutter/material.dart';
import 'package:luke_flow_diagram/luke_flow_diagram.dart';
import 'package:luke_flow_diagram/models/grid_background_settings.dart';

class CustomCanvas extends StatefulWidget {
  const CustomCanvas({super.key});

  @override
  State<CustomCanvas> createState() => _CustomCanvasState();
}

class _CustomCanvasState extends State<CustomCanvas> {
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
        bacgrkoundGridSettings: BackgroundGridSettings(
          xDensity: 50,
          yDensity: 50,
          showDots: true,
          lineColor: const Color.fromARGB(82, 0, 0, 0),
          lineWidth: 2,
          dotColor: const Color.fromARGB(255, 0, 0, 0),
          dotRadius: 2,
          showLines: true,
        ),
        controller: controller,
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
      ),
    );
  }
}

import 'package:advanced_widgets_app/app_theme.dart';
import 'package:flutter/material.dart';

import 'shadow_widget.dart';
import 'weather_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double ws = 0.5;
  late AnimationController controller;
  late Animation<double> animation;
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 1.0, end: 2.0).animate(controller)
      ..addStatusListener(
          (status) => isAnimated = status == AnimationStatus.completed);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      color: Colors.white,
      child: Builder(builder: (innerContext) {
        Color? scaffoldColor = AppTheme.of(innerContext)!.color;

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    isAnimated ? controller.reverse() : controller.forward();
                    isAnimated = !isAnimated;
                  },
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 200,
                            // color: Colors.amber,
                            child: Transform.scale(
                              scale: animation.value,
                              child: CustomPaint(
                                painter: WeatherIndicator(wheatherState: ws),
                              ),
                            ),
                          ),
                          isAnimated
                              ? const ShadowWidget(
                                  child: Text(
                                  'TEMPERATURE = 25',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 32),
                                ))
                              : Container(),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Slider(
                        label: ws.toString(),
                        value: ws,
                        max: 1,
                        divisions: 10,
                        min: 0,
                        onChanged: (double value) => setState(
                          () => ws = value,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          backgroundColor: scaffoldColor,
          floatingActionButton: FloatingActionButton.large(
            child: const Center(child: Text('Change')),
            onPressed: () => setState(() {
              // как изменить инхерит виджет чтобы цвет поменялся
              scaffoldColor = Colors.amberAccent;
            }),
          ),
        );
      }),
    );
  }
}

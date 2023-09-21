library neubrutalism_theme;

import 'package:flutter/material.dart';

enum NeuBtnType {
  round,
  square,
}

enum NeuAnimationType {
  dynamicBtn,
  staticBtn,
}

class NeuButton extends StatelessWidget {
  const NeuButton({
    super.key,
    this.height,
    this.width,
    this.elevation = 7,
    this.borderWidth = 4,
    this.color = Colors.white,
    this.btnType = NeuBtnType.square,
    this.animationType = NeuAnimationType.dynamicBtn,
    this.animationDuration = 300,
    required this.onPressed,
    required this.child,
  });

  final double? height;
  final double? width;
  final double elevation;
  final double borderWidth;
  final Color color;
  final NeuBtnType btnType;
  final NeuAnimationType animationType;
  final int animationDuration;

  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (btnType == NeuBtnType.square &&
        animationType == NeuAnimationType.dynamicBtn) {
      return NeuBtnDynamic(
        height: height,
        width: width,
        elevation: elevation,
        borderWidth: borderWidth,
        color: color,
        animationDuration: animationDuration,
        radius: 0,
        onPressed: onPressed,
        child: child,
      );
    }
    if (btnType == NeuBtnType.round &&
        animationType == NeuAnimationType.dynamicBtn) {
      return NeuBtnDynamic(
        height: height,
        width: width,
        elevation: elevation,
        borderWidth: borderWidth,
        color: color,
        animationDuration: animationDuration,
        radius: 20,
        onPressed: onPressed,
        child: child,
      );
    }
    // if (btnType == NeuBtnType.square && animationType == NeuAnimationType.staticBtn) {
    //   return _NeuBtnSquareStatic(height: height, width: width, elevation: elevation, borderWidth: borderWidth, color: color, animationDuration: animationDuration, onPressed: onPressed, child: child,);
    // }
    // if (btnType == NeuBtnType.round && animationType == NeuAnimationType.staticBtn) {
    //   return _NeuBtnRoundStatic(height: height, width: width, elevation: elevation, borderWidth: borderWidth, color: color, animationDuration: animationDuration, radius: 20, onPressed: onPressed, child: child,);
    // }

    // todo no animation
    return Text("TODO NO ANIMATION");
  }
}

class NeuBtnDynamic extends StatefulWidget {
  const NeuBtnDynamic(
      {super.key,
        this.height,
        this.width,
        required this.elevation,
        required this.borderWidth,
        required this.color,
        required this.animationDuration,
        required this.radius,
        required this.onPressed,
        required this.child});

  final double? height;
  final double? width;
  final double elevation;
  final double borderWidth;
  final Color color;
  final int animationDuration;
  final double radius;

  final Function onPressed;
  final Widget child;

  @override
  State<NeuBtnDynamic> createState() => _NeuBtnDynamicState();
}

class _NeuBtnDynamicState extends State<NeuBtnDynamic>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.animationDuration),
      vsync: this,
    );
    _animation = Tween<Offset>(
        begin: const Offset(0, 0),
        end: Offset(widget.elevation, widget.elevation))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: GestureDetector(
        onTap: () => _controller.forward().then((value) {
          _controller.reverse();
          widget.onPressed();
        }),
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, l) {
              return Transform.translate(
                offset: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(widget.elevation - _animation.value.dx,
                              widget.elevation - _animation.value.dy))
                    ],
                    border: Border.all(
                        color: Colors.black, width: widget.borderWidth),
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius),
                    ),
                  ),
                  child: widget.child,
                ),
              );
            }),
      ),
    );
    ;
  }
}

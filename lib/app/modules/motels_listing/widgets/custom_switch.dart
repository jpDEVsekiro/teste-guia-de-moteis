import 'package:flutter/material.dart';
import 'package:guia_de_moteis/app/design_system/palette.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController = AnimationController(
      duration: const Duration(milliseconds: 150), vsync: this);
  late Animation<double> _circleAnimation;
  bool state = true;

  @override
  Widget build(BuildContext context) {
    _circleAnimation = Tween<double>(
            begin: 0, end: MediaQuery.of(context).size.width * 0.68 / 2)
        .animate(_animationController);
    return GestureDetector(
      onTap: () {
        state = !state;
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
        setState(() {});
        widget.onChanged(!state);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.68,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Palette.primaryAccent,
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Padding(
                    padding: EdgeInsets.only(left: _circleAnimation.value),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.68 / 2,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Palette.secondary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                }),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bolt_rounded,
                            color: state ? Palette.primary : Palette.secondary),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'ir agora',
                          style: TextStyle(
                            color:
                                state ? Palette.textColor : Palette.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            color: state ? Palette.secondary : Palette.primary),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'ir outro dia',
                          style: TextStyle(
                            color:
                                state ? Palette.secondary : Palette.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

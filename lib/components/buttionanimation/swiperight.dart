import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class ButtonSwipeRight extends StatefulWidget {
  final String title;
  final Widget tujuan;
  final Color titleColor;
  final Color roundedBgColor;
  final Color bgColor;
  final Color iconColor;
  const ButtonSwipeRight(
      {super.key,
      this.title = "Test Tombol",
      required this.tujuan,
      this.bgColor = const Color(0xFF1A1D11),
      this.iconColor = Colors.white,
      this.titleColor = Colors.white,
      this.roundedBgColor = const Color(0xFF00880F)});

  @override
  State<ButtonSwipeRight> createState() => _ButtonSwipeRightState();
}

class _ButtonSwipeRightState extends State<ButtonSwipeRight> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return SwipeableButtonView(
      buttonText: widget.title,
      buttontextstyle: TextStyle(fontSize: 18, color: widget.titleColor),
      buttonWidget: Icon(
        Icons.arrow_forward_ios_rounded,
        color: widget.iconColor,
        size: 20,
      ),
      buttonColor: widget.roundedBgColor,
      activeColor: widget.bgColor,
      onWaitingProcess: () {
        Future.delayed(const Duration(seconds: 1),
            () => setState(() => isFinished = true));
      },
      isFinished: isFinished,
      onFinish: () async {
        // - - - Navigate to confirmation page - - -
        await Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: widget.tujuan));
        // - - - Reset isFinished variable  - - -
        setState(() => isFinished = false);
      },
    );
  }
}

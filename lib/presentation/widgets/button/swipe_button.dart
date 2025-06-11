import 'package:flutter/material.dart';

class XSwipeButton extends StatefulWidget {
  const XSwipeButton({
    super.key,
    required this.title,
    this.subTitle,
    required this.onSwipeDone,
    required this.backgroundColor,
    required this.subBackgroundColor,
    required this.textColor,
    required this.subTextColor,
  });

  final String title;
  final String? subTitle;
  final Function(bool) onSwipeDone;
  final Color backgroundColor;
  final Color subBackgroundColor;
  final Color textColor;
  final Color subTextColor;

  @override
  State<XSwipeButton> createState() => _XSwipeButtonState();
}

class _XSwipeButtonState extends State<XSwipeButton> {
  late final SwipeData swipeData;
  final double sliderHeight = 70.0;
  final double sliderButtonWidth = 70.0;

  @override
  void initState() {
    super.initState();
    swipeData = SwipeData();
  }

  @override
  void dispose() {
    swipeData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final trackWidth = screenWidth * 0.85;
    final double maxSwipe = trackWidth - sliderButtonWidth;

    return Center(
      child: ValueListenableBuilder<bool>(
        valueListenable: swipeData.isPaymentSuccessfulNotifier,
        builder: (context, isPaymentSuccessful, _) {
          return Container(
            // Main track container
            width: trackWidth,
            height: sliderHeight,
            decoration: BoxDecoration(
              // Point 1: Track background changes on success
              color: isPaymentSuccessful
                  ? widget.subBackgroundColor
                  : widget.backgroundColor,
              borderRadius: BorderRadius.circular(sliderHeight / 2),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // 1. Filled portion (Dynamic background during swipe)
                ValueListenableBuilder<double>(
                  valueListenable: swipeData.swipePositionNotifier,
                  builder: (context, position, _) {
                    double fillWidth = position + (sliderButtonWidth / 2);
                    fillWidth = fillWidth.clamp(0.0, trackWidth);

                    if (position == 0) {
                      return const SizedBox.shrink();
                    }

                    return Container(
                      width: fillWidth,
                      height: sliderHeight,
                      decoration: BoxDecoration(
                        // Point 1: Fill color logic updated
                        // Active swipe color if not successful, transparent if successful (shows track's green)
                        color: isPaymentSuccessful
                            ? Colors.transparent
                            : widget.backgroundColor,
                        borderRadius: BorderRadius.circular(sliderHeight / 2),
                      ),
                    );
                  },
                ),

                // 2. Text and Checkmark Overlay
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sliderButtonWidth / 2 + 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            isPaymentSuccessful
                                ? widget.title
                                : widget.subTitle ?? '',
                            style: TextStyle(
                              color: isPaymentSuccessful
                                  ? widget.textColor
                                  : widget.subTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isPaymentSuccessful)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.check_circle,
                              color: widget.subTextColor,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // 3. Draggable button
                // Point 2: Button visibility controlled by isPaymentSuccessful
                ValueListenableBuilder<bool>(
                  valueListenable: swipeData.isPaymentSuccessfulNotifier,
                  builder: (context, isConfirmed, buttonChild) {
                    // Only show the button if payment is NOT confirmed
                    return Visibility(
                      visible: !isConfirmed,
                      child: buttonChild!, // The button itself
                    );
                  },
                  child: ValueListenableBuilder<double>(
                    // This is the buttonChild
                    valueListenable: swipeData.swipePositionNotifier,
                    builder: (context, position, _) {
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 50),
                        left: position,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            // Dragging is implicitly disabled if button is not visible
                            // but this check is still good practice if Visibility wasn't used.
                            if (swipeData.isPaymentConfirmed) return;

                            double newPosition =
                                swipeData.currentSwipePosition +
                                    details.delta.dx;
                            swipeData.swipePosition =
                                newPosition.clamp(0.0, maxSwipe);
                          },
                          onHorizontalDragEnd: (details) {
                            if (swipeData.isPaymentConfirmed) return;

                            if (swipeData.currentSwipePosition >=
                                maxSwipe - 1.0) {
                              swipeData.swipePosition = maxSwipe; // Snap to end
                              swipeData.setPaymentSuccessful(true);
                              widget.onSwipeDone(true);
                            } else {
                              swipeData.reset();
                            }
                          },
                          child: Container(
                            width: sliderButtonWidth,
                            height: sliderHeight,
                            decoration: BoxDecoration(
                              color: widget.backgroundColor,
                              borderRadius:
                                  BorderRadius.circular(sliderHeight / 2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SwipeData {
  final ValueNotifier<double> _swipePosition = ValueNotifier(0.0);
  final ValueNotifier<bool> _isPaymentSuccessful = ValueNotifier(false);

  ValueNotifier<double> get swipePositionNotifier => _swipePosition;
  ValueNotifier<bool> get isPaymentSuccessfulNotifier => _isPaymentSuccessful;

  double get currentSwipePosition => _swipePosition.value;
  bool get isPaymentConfirmed => _isPaymentSuccessful.value;

  set swipePosition(double value) {
    _swipePosition.value = value;
  }

  void setPaymentSuccessful(bool value) {
    _isPaymentSuccessful.value = value;
  }

  void reset() {
    _swipePosition.value = 0.0;
    _isPaymentSuccessful.value = false;
  }

  void dispose() {
    _swipePosition.dispose();
    _isPaymentSuccessful.dispose();
  }
}

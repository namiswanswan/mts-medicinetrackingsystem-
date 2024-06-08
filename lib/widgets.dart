import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  final TextStyle _textStyle = const TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  const CustomLink({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: _textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final String text;

  final TextStyle _textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  final Color _backgroundColor = const Color(0xFF1C2A3A);
  final Color _borderColor = const Color(0xFFE5E7EB);
  final double _borderRadius = 61;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.width = 311,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              padding: padding,
              decoration: ShapeDecoration(
                color: _backgroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: _borderColor),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: _textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final int activeIndex;
  final int totalCount;

  final Color activeColor;
  final Color inactiveColor;
  final double activeWidth;
  final double inactiveWidth;
  final double indicatorHeight;
  final double borderRadius;
  final double spacing;

  const CustomIndicator({
    Key? key,
    required this.activeIndex,
    required this.totalCount,
    this.activeColor = const Color(0xFF26232F),
    this.inactiveColor = const Color(0xFF9B9B9B),
    this.activeWidth = 30,
    this.inactiveWidth = 8,
    this.indicatorHeight = 8,
    this.borderRadius = 40,
    this.spacing = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: indicatorHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(totalCount, (index) {
          return Row(
            children: [
              Container(
                width: index == activeIndex ? activeWidth : inactiveWidth,
                height: indicatorHeight,
                decoration: ShapeDecoration(
                  color: index == activeIndex ? activeColor : inactiveColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              if (index < totalCount - 1) SizedBox(width: spacing),
            ],
          );
        }),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 342,
          height: 55,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                decoration: ShapeDecoration(
                  color: Color(0xFFF9FAFB),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Color(0xFF9CA3AF),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final String buttonText;
  final Widget icon;
  final double width;
  final double height;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback? onTap;

  const SocialButton({
    Key? key,
    required this.buttonText,
    required this.icon,
    required this.onTap,
    this.width = 342,
    this.height = 50,
    this.iconSize = 20,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
    this.backgroundColor = const Color(0xFFF9FAFB),
    this.borderColor = const Color(0xFFE5E7EB),
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: icon,
            ),
            SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(
                color: Color(0xFF1C2A3A),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Modal extends StatelessWidget {
  final String title;
  final String message;
  final bool buttonVisibility;
  final String buttonText;
  final VoidCallback? onTap;
  final Widget icon;

  const Modal({
    Key? key,
    required this.title,
    required this.message,
    this.buttonText = "",
    this.buttonVisibility = true,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF1C2A3A),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),
                if (buttonVisibility && buttonText.isNotEmpty)
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 311,
                      height: 50,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 311,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            decoration: ShapeDecoration(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(61),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  buttonText,
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<Icon> icons;
  final List<VoidCallback> onTapFunctions;

  const CustomBottomNavigationBar({
    Key? key,
    required this.icons,
    required this.onTapFunctions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < icons.length; i++)
            GestureDetector(
              onTap: onTapFunctions[i],
              child: Container(
                width: 24,
                height: 24,
                child: icons[i],
              ),
            ),
        ],
      ),
    );
  }
}

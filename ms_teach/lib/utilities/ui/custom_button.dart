import 'package:flutter/material.dart';
import 'package:ms_teach/utilities/app_colors.dart';

enum ButtonSize { small, large }

enum ButtonColor { primary, secondary, tertiary, quaternary }

class CustomButton extends StatefulWidget {
  final String text;
  final String? subtitle;
  final VoidCallback onPressed;
  final Color? tintColor;
  final ButtonSize size;
  final ButtonColor color;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool isEnabled;
  final double? height;
  final TextAlign textAlign;
  final MainAxisAlignment mainAxisAlignment;

  const CustomButton({
    super.key,
    this.tintColor,
    required this.text,
    this.subtitle,
    required this.onPressed,
    this.size = ButtonSize.large,
    this.color = ButtonColor.primary,
    this.leftIcon,
    this.rightIcon,
    this.isEnabled = true,
    this.height,
    this.textAlign = TextAlign.center,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (widget.isEnabled) {
          setState(() {
            isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (widget.isEnabled) {
          setState(() {
            isPressed = false;
          });
          widget.onPressed();
        }
      },
      onTapCancel: () {
        if (widget.isEnabled) {
          setState(() {
            isPressed = false;
          });
        }
      },
      child: SizedBox(
        height: _getHeight(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: _getColor(),
            borderRadius: BorderRadius.circular(8),
            border: _getBorder(),
          ),
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.leftIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: widget.leftIcon!,
                  ),
                ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.text,
                        overflow: TextOverflow.ellipsis,
                        textAlign: widget.textAlign,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: widget.tintColor ?? _getFontColor(),
                        ),
                      ),
                      if (widget.subtitle?.isNotEmpty ?? false)
                        Text(
                          widget.subtitle!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: widget.tintColor ?? _getFontColor(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (widget.rightIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: widget.rightIcon!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  BoxBorder? _getBorder() {
    if (!widget.isEnabled) {
      return null;
    }
    switch (widget.color) {
      case ButtonColor.primary:
        return Border.all(width: 1, color: AppColors.primary);
      case ButtonColor.secondary:
        return Border.all(width: 1, color: AppColors.lightBlue);
      case ButtonColor.tertiary:
        return null;
      case ButtonColor.quaternary:
        return Border.all(width: 1, color: AppColors.red);
    }
  }

  double? _getHeight() {
    if (widget.height != null) {
      return widget.height;
    }
    switch (widget.size) {
      case ButtonSize.small:
        return 36.0;
      case ButtonSize.large:
        return 44.0;
    }
  }

  Color _getFontColor() {
    if (!widget.isEnabled) {
      return AppColors.gray400;
    }

    switch (widget.color) {
      case ButtonColor.primary:
        return AppColors.white;

      case ButtonColor.secondary:
        return AppColors.primary;

      case ButtonColor.tertiary:
        return !isPressed ? AppColors.primary : AppColors.primaryDark;

      case ButtonColor.quaternary:
        return AppColors.white;
    }
  }

  Color _getColor() {
    if (!widget.isEnabled && widget.color != ButtonColor.tertiary) {
      return AppColors.gray200;
    }

    switch (widget.color) {
      case ButtonColor.primary:
        return !isPressed ? AppColors.primary : AppColors.primaryDark;

      case ButtonColor.secondary:
        return !isPressed ? AppColors.lightBlue : const Color(0xFFD8EAFF);

      case ButtonColor.tertiary:
        return Colors.transparent;

      case ButtonColor.quaternary:
        return !isPressed ? AppColors.red : AppColors.redDark;
    }
  }
}

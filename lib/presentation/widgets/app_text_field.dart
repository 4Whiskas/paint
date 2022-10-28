import 'package:flutter/material.dart';
import 'package:paint/gen/colors.gen.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.title = '',
    required this.controller,
    this.obscure = false,
    this.maxLength,
    this.maxLines,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.height = 60,
    this.onEnterText,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final bool obscure;
  final int? maxLength;
  final int? maxLines;
  final bool enabled;
  final TextInputType keyboardType;
  final double height;
  final VoidCallback? onEnterText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.left,
        onChanged: (val) {
          if (widget.onEnterText != null) {
            widget.onEnterText!();
          }
        },
        decoration: InputDecoration(
          labelText: widget.title,
          suffixIcon: widget.obscure
              ? isObscured
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = false;
                        });
                      },
                      icon: const Icon(Icons.visibility),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = true;
                        });
                      },
                      icon: const Icon(Icons.visibility_off),
                    )
              : const SizedBox.shrink(),
          border: widget.maxLines != null
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.darkGrey,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.darkGrey,
                  ),
                ),
          errorBorder: widget.maxLines != null
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.red,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.red,
                  ),
                ),
          enabledBorder: widget.maxLines != null
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.darkGrey,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.darkGrey,
                  ),
                ),
          focusedErrorBorder: widget.maxLines != null
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.red,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.red,
                  ),
                ),
          disabledBorder: widget.maxLines != null
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.grey,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.grey,
                  ),
                ),
          focusedBorder: widget.maxLines != null
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.blue,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.blue,
                  ),
                ),
        ),
        // expands: true,
        maxLength: widget.maxLength,
        maxLines: widget.obscure ? 1 : widget.maxLines,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure ? isObscured : false,
        obscuringCharacter: '*',
      ),
    );
  }
}

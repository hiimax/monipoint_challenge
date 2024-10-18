import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monipoint_challenge/resources/colors.dart';

class PrimaryInputField extends TextFormField {
  PrimaryInputField({
    required BuildContext context,
    super.key,
    String? hintText,
    String? Function(String?)? validator,
    Widget? prefixIcon,
    int? maxLines,
    super.controller,
    super.onChanged,
    super.textCapitalization,
    super.inputFormatters,
    bool required = true,
  }) : super(
          decoration: InputDecoration(
            fillColor: AppColors.skyWhite,
            filled: true,
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 8,
                      top: 12,
                      bottom: 12,
                    ),
                    child: prefixIcon,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.skyWhite,
                width: 0.8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.skyWhite,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 0.8,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.error,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.skyWhite,
                width: 0.8,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.skyWhite,
                width: 0.8,
              ),
            ),
            hintStyle: const TextStyle(
              color: AppColors.pureBlack,
              fontSize: 12,
            ),
          ),
          maxLines: maxLines ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        );
}

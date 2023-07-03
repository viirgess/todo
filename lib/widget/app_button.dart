import 'package:flutter/material.dart';

import '../utils/color_source.dart';
import '../utils/text_style_source.dart';

enum ButtonStatus { loading, active, unActive }

class AppButton extends StatelessWidget {
  final String title;
  final bool exp;
  final Function callBack;
  final bool isEnable;
  final ButtonStatus status;

  const AppButton(
      {super.key,
      required this.title,
      this.exp = false,
      required this.callBack,
      this.isEnable = true, 
      this.status= ButtonStatus.active,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => status == ButtonStatus.loading ? null: isEnable ? callBack() : null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: exp ? 0.0 : 16),
        height: 56,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isEnable ? ColorSource.black : ColorSource.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child:status == ButtonStatus.loading ? const CircularProgressIndicator(
          color: ColorSource.white, strokeWidth: 2,
        ): 
        Text(
              title,
          style: TextStyleSource.body1.copyWith(
            color: isEnable ? ColorSource.white : ColorSource.lightGrey,
          ),
        ),
      ),
    );
  }
}

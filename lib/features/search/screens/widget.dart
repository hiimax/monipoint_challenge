import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipoint_challenge/core/utils/spacer.dart';
import 'package:monipoint_challenge/resources/colors.dart';

class SearchNavigators extends StatelessWidget {
  const SearchNavigators({super.key, required this.showOverlay});
  final Function() showOverlay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70, right: 20, left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.sampleColor8,
                ),
                child: Icon(
                  Icons.menu,
                  color: AppColors.skyWhite,
                ),
              ),
              const YMargin(5),
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.sampleColor8,
                ),
                child: IconButton(
                  onPressed: showOverlay,
                  icon: Icon(
                    Icons.send,
                    color: AppColors.skyWhite,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 50.sp,
            decoration: BoxDecoration(
              color: AppColors.sampleColor8,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    Icons.sort,
                    color: AppColors.skyWhite,
                  ),
                  const XMargin(10),
                  Text(
                    'List of variants',
                    style: TextStyle(
                      color: AppColors.skyWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

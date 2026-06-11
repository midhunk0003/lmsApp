import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/colors.dart';

class RatingAndStudentEnrollWidget extends StatelessWidget {
  const RatingAndStudentEnrollWidget({super.key, required bool isTablet})
    : _isTablet = isTablet;

  final bool _isTablet;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: _isTablet ? 20 : 12,
      runSpacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/svg/star.svg', width: _isTablet ? 20 : 16),

            SizedBox(width: 4),

            Text(
              '4.9',
              style: TextStyle(
                color: AppColor.ghostwhite,
                fontSize: _isTablet ? 16 : 14,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(width: 4),

            Flexible(
              child: Text(
                '(1.5k Reviews)',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.lightgray,
                  fontSize: _isTablet ? 16 : 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/svg/enrollstudent.svg',
              width: _isTablet ? 20 : 16,
            ),

            SizedBox(width: 4),

            Text(
              '12,000',
              style: TextStyle(
                color: AppColor.ghostwhite,
                fontSize: _isTablet ? 16 : 14,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(width: 4),

            Flexible(
              child: Text(
                '(Students Enrolled)',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.lightgray,
                  fontSize: _isTablet ? 16 : 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

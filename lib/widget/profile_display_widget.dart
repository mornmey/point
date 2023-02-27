import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/config/app_text.dart';
import 'package:horpao_point/config/colors.dart';

class ProfileDisplayWidget extends ConsumerWidget {
  final String? title;
  final String? subtitle;
  final String? imgProfile;
  final VoidCallback? onTap;
  const ProfileDisplayWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.imgProfile,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Visibility(
            // visible: imgProfile == null,
            replacement: CircleAvatar(
              radius: 25,
              backgroundColor: AppColorSets.colorPrimaryBlue,
              backgroundImage: NetworkImage(imgProfile ?? ""),
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: AppColorSets.colorPrimaryBlue,
              backgroundImage: AssetImage("lib/assets/images/profile.png"),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.titleText(
              fontSize: 18,
              color: AppColorSets.backgroundBlueColor,
              title: title,
            ),
            const SizedBox(height: 6),
            AppText.subTitleText(
              subTitle: subtitle,
            ),
          ],
        )
      ],
    );
  }
}

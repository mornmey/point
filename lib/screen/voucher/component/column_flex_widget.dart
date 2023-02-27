import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';

class ColumnFlexWidget extends StatelessWidget {
  const ColumnFlexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            (constraints.constrainHeight() / 8).floor(),
            (index) => const SizedBox(
              height: 5,
              width: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColorSets.backgroundWhiteColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

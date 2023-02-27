import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';

class RowFlexWidget extends StatelessWidget {
  const RowFlexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 30,
          width: 15,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorSets.backgroundWhiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                  (constraints.constrainWidth() / 8).floor(),
                  (index) => const SizedBox(
                    height: 1,
                    width: 5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColorSets.backgroundBlueColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
          width: 15,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorSets.backgroundWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

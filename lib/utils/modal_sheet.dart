import 'package:flutter/material.dart';

import '../config/router.dart';
import '../constants/widgets.dart';

Future<void> showAppModalBottomSheet({
  required List<Widget> children,
  double horizontalPadding = 0,
}) async {
  final mediaQuery = MediaQuery.of(AppRouter.ctx);
  await showModalBottomSheet(
    context: AppRouter.ctx,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: mediaQuery.size.height - mediaQuery.padding.top,
      minWidth: mediaQuery.size.width,
    ),
    builder: (ctx) {
      // Must be recalculated with builder ctx to get accurate keyboard height.
      final mediaQuery = MediaQuery.of(ctx);
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(ctx).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: horizontalPadding,
            bottom: mediaQuery.viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Widgets.spacingVertical,
              const SizedBox(
                width: 32,
                child: Divider(thickness: 2, color: Colors.grey, height: 4),
              ),
              const SizedBox(
                width: 32,
                child: Divider(thickness: 2, color: Colors.grey, height: 4),
              ),
              Widgets.spacingVertical,
              Widgets.spacingVertical,
              ...children,
              Widgets.spacingVertical,
              Widgets.spacingVertical,
            ],
          ),
        ),
      );
    },
  );
}

class ModalSheetButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final Function onPressed;

  const ModalSheetButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(50, 50),
              shape: const CircleBorder(),
            ),
            child: icon,
            onPressed: () {
              Navigator.of(context).pop();
              onPressed();
            },
          ),
          Widgets.listSeparator,
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

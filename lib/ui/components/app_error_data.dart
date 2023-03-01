// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/translations.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_text.dart';

class AppErrorData extends StatelessWidget {
  final String text;

  const AppErrorData({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText(
            text: '$errorResponse:',
            color: Colors.green,
            fontSize: 16,
          ),
          AppText(
            text: text,
            padding: const EdgeInsets.all(16),
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}

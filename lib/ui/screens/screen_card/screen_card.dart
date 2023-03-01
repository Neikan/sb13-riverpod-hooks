// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/keys.dart';
import 'package:mtg_riverpod_hooks/consts/translations.dart';
import 'package:mtg_riverpod_hooks/store/card/providers.dart';
import 'package:mtg_riverpod_hooks/store/card/state.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_error_data.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_header.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_loader.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_text.dart';

class ScreenCard extends HookConsumerWidget {
  final String cardId;
  final String title;

  const ScreenCard({
    super.key,
    required this.cardId,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardState = ref.watch(providerCardState);

    useEffect(() {
      if (cardState == const StateCard.init()) {
        ref.read(providerCardState.notifier).getData(cardId);
      }

      return null;
    });

    return Scaffold(
      appBar: AppHeader(title: title),
      body: cardState.when(
        init: () => const Center(
          child: AppLoader(),
        ),
        loaded: (card) => SafeArea(
          child: Center(
            child: AppText(
              text: labelsCard[keyContent]!,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        error: (error) => AppErrorData(text: error),
      ),
    );
  }
}

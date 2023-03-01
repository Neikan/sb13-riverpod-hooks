// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/store/cards/providers.dart';
import 'package:mtg_riverpod_hooks/store/cards/state.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_error_data.dart';
import 'package:mtg_riverpod_hooks/ui/screens/screen_cards/components/header_cards/header_cards.dart';
import 'package:mtg_riverpod_hooks/ui/screens/screen_cards/components/loader_cards.dart';
import 'package:mtg_riverpod_hooks/ui/screens/screen_cards/components/view_cards.dart';

class ScreenCards extends HookConsumerWidget {
  const ScreenCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsState = ref.watch(providerCardsState);

    useEffect(() {
      if (cardsState == const StateCards.init()) {
        ref.read(providerCardsState.notifier).load();
      }

      return null;
    });

    return cardsState.when(
      init: () => const LoaderCards(),
      loaded: (cards) => ViewCards(cards: cards),
      error: (error) => Scaffold(
        appBar: const HeaderCards(),
        body: AppErrorData(text: error),
      ),
    );
  }
}

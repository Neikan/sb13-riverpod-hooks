// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/keys.dart';
import 'package:mtg_riverpod_hooks/consts/translations.dart';
import 'package:mtg_riverpod_hooks/models/mtg_card_info/mtg_card_info.dart';
import 'package:mtg_riverpod_hooks/store/cards/providers.dart';
import 'package:mtg_riverpod_hooks/store/cart/providers.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_header.dart';
import 'package:mtg_riverpod_hooks/ui/components/app_text.dart';
import 'package:mtg_riverpod_hooks/ui/screens/screen_cards/components/list_cards/list_card.dart';

class ScreenCart extends ConsumerWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.read(providerCardsData);
    final cardsInCart = ref.watch(providerCartData);

    List<MtgCardInfo> cardsToList = [];

    for (final card in cards) {
      if (cardsInCart.contains(card.id)) {
        cardsToList.add(card);
      }
    }

    return Scaffold(
      appBar: AppHeader(
        title: labelsCart[keyTitle]!,
      ),
      body: SafeArea(
        child: cardsInCart.isEmpty
            ? Center(
                child: AppText(
                  text: labelsCart[keyContent]!,
                  fontSize: 16,
                ),
              )
            : ListCards(cards: cardsToList),
      ),
    );
  }
}

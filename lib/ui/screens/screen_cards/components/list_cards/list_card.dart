// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/keys.dart';
import 'package:mtg_riverpod_hooks/models/mtg_card_info/mtg_card_info.dart';
import 'package:mtg_riverpod_hooks/ui/screens/screen_cards/components/list_cards/list_card_preview.dart';

class ListCards extends StatelessWidget {
  final List<MtgCardInfo> cards;

  const ListCards({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey(keyCardsList),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: cards.length,
      itemBuilder: (_, index) => ListCardPreview(
        card: cards[index],
      ),
    );
  }
}

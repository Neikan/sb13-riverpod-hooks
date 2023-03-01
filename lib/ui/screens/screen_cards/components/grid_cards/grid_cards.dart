// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/keys.dart';
import 'package:mtg_riverpod_hooks/models/mtg_card_info/mtg_card_info.dart';
import 'package:mtg_riverpod_hooks/ui/screens/screen_cards/components/grid_cards/grid_card_preview.dart';

class GridCards extends StatelessWidget {
  final List<MtgCardInfo> cards;

  const GridCards({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey(keyCardsGrid),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
      ),
      itemCount: cards.length,
      itemBuilder: (_, index) => GridCardPreview(
        card: cards[index],
      ),
    );
  }
}

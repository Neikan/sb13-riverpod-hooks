// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/keys.dart';
import 'package:mtg_riverpod_hooks/consts/routes.dart';
import 'package:mtg_riverpod_hooks/models/mtg_card_info/mtg_card_info.dart';

class ButtonGoToCard extends StatelessWidget {
  final MtgCardInfo card;

  const ButtonGoToCard({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.shade700,
      ),
      onPressed: () {
        final arguments = {keyCard: card};

        Navigator.of(context).pushNamed(
          routeCard,
          arguments: arguments,
        );
      },
    );
  }
}

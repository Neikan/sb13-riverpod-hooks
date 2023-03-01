// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/models/mtg_card_info/mtg_card_info.dart';
import 'package:mtg_riverpod_hooks/repository/repository_cards/repository_cards_imp.dart';
import 'package:mtg_riverpod_hooks/store/cards/notifiers.dart';
import 'package:mtg_riverpod_hooks/store/cards/state.dart';

const _repositoryCards = RepositoryCardsImp();

final providerCardsData =
    StateNotifierProvider<NotifierCardsData, List<MtgCardInfo>>(
  (_) => NotifierCardsData(_repositoryCards.data),
);

final providerCardsState =
    StateNotifierProvider<NotifierCardsState, StateCards>(
  (_) => NotifierCardsState(_repositoryCards),
);

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/store/card/notifiers.dart';
import 'package:mtg_riverpod_hooks/store/card/state.dart';

final providerCardState =
    StateNotifierProvider.autoDispose<NotifierCardState, StateCard>(
  (_) => NotifierCardState(),
);

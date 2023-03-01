// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/repository/repository_cart/repository_cart_imp.dart';
import 'package:mtg_riverpod_hooks/store/cart/notifiers.dart';

final providerCartData = StateNotifierProvider<NotifierCartData, List<String>>(
  (_) => NotifierCartData(const RepositoryCartImp(), []),
);

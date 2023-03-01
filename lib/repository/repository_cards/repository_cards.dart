// Project imports:
import 'package:mtg_riverpod_hooks/models/mtg_card_info/mtg_card_info.dart';

abstract class RepositoryCards {
  const RepositoryCards();

  List<MtgCardInfo> get data;

  Future<List<MtgCardInfo>> load();
}

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/initialization.dart';
import 'package:mtg_riverpod_hooks/ui/components/app.dart';

void main() {
  initializeServices();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

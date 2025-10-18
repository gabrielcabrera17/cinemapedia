

import 'package:flutter_riverpod/flutter_riverpod.dart';
// lo que necesito de riverpod para manejar una variable de string
final searchQueryProvider = StateProvider<String>((ref) => 'batman',);


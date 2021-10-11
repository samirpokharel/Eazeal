import 'package:flutter_riverpod/flutter_riverpod.dart';
import './utils/utils.dart';
import './services/services.dart';

final navigationProvider = Provider<NavigationServices>((ref) {
  return NavigationServices();
});

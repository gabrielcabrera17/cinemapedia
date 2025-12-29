//Con esto manejara la instancia de mi drift datasource


import 'package:cinemapedia/infrastructure/datasources/drift_datasource.dart';
import 'package:cinemapedia/infrastructure/repostitories/local_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: DriftDatasource());
},);
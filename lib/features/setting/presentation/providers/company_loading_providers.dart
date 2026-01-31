import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_loading_providers.g.dart';

@Riverpod(keepAlive: true)
class CompanyUpdateLoading extends _$CompanyUpdateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}


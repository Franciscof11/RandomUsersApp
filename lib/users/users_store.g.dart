// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsersStore on _UsersStore, Store {
  Computed<int>? _$totalUserComputed;

  @override
  int get totalUser => (_$totalUserComputed ??=
          Computed<int>(() => super.totalUser, name: '_UsersStore.totalUser'))
      .value;

  late final _$getUsersRepositoryAsyncAction =
      AsyncAction('_UsersStore.getUsersRepository', context: context);

  @override
  Future getUsersRepository() {
    return _$getUsersRepositoryAsyncAction
        .run(() => super.getUsersRepository());
  }

  late final _$getUsersApiAsyncAction =
      AsyncAction('_UsersStore.getUsersApi', context: context);

  @override
  Future getUsersApi() {
    return _$getUsersApiAsyncAction.run(() => super.getUsersApi());
  }

  late final _$getUsersDbAsyncAction =
      AsyncAction('_UsersStore.getUsersDb', context: context);

  @override
  Future getUsersDb() {
    return _$getUsersDbAsyncAction.run(() => super.getUsersDb());
  }

  late final _$noFilterAsyncAction =
      AsyncAction('_UsersStore.noFilter', context: context);

  @override
  Future noFilter() {
    return _$noFilterAsyncAction.run(() => super.noFilter());
  }

  late final _$filterMaleAsyncAction =
      AsyncAction('_UsersStore.filterMale', context: context);

  @override
  Future filterMale() {
    return _$filterMaleAsyncAction.run(() => super.filterMale());
  }

  late final _$filterFemaleAsyncAction =
      AsyncAction('_UsersStore.filterFemale', context: context);

  @override
  Future filterFemale() {
    return _$filterFemaleAsyncAction.run(() => super.filterFemale());
  }

  @override
  String toString() {
    return '''
totalUser: ${totalUser}
    ''';
  }
}

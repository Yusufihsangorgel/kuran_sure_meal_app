// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Kuran_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$KuranViewModel on _KuranViewModelBase, Store {
  final _$postsAtom = Atom(name: '_KuranViewModelBase.posts');

  @override
  List<Kuran> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Kuran> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$sureLinkAtom = Atom(name: '_KuranViewModelBase.sureLink');

  @override
  int get sureLink {
    _$sureLinkAtom.reportRead();
    return super.sureLink;
  }

  @override
  set sureLink(int value) {
    _$sureLinkAtom.reportWrite(value, super.sureLink, () {
      super.sureLink = value;
    });
  }

  final _$getSureAtom = Atom(name: '_KuranViewModelBase.getSure');

  @override
  bool get getSure {
    _$getSureAtom.reportRead();
    return super.getSure;
  }

  @override
  set getSure(bool value) {
    _$getSureAtom.reportWrite(value, super.getSure, () {
      super.getSure = value;
    });
  }

  final _$sureAdAtom = Atom(name: '_KuranViewModelBase.sureAd');

  @override
  String get sureAd {
    _$sureAdAtom.reportRead();
    return super.sureAd;
  }

  @override
  set sureAd(String value) {
    _$sureAdAtom.reportWrite(value, super.sureAd, () {
      super.sureAd = value;
    });
  }

  final _$isErrorAtom = Atom(name: '_KuranViewModelBase.isError');

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_KuranViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getKuranAsyncAction = AsyncAction('_KuranViewModelBase.getKuran');

  @override
  Future getKuran() {
    return _$getKuranAsyncAction.run(() => super.getKuran());
  }

  final _$_KuranViewModelBaseActionController =
      ActionController(name: '_KuranViewModelBase');

  @override
  void addSureInput(String inputSure, int getLink) {
    final _$actionInfo = _$_KuranViewModelBaseActionController.startAction(
        name: '_KuranViewModelBase.addSureInput');
    try {
      return super.addSureInput(inputSure, getLink);
    } finally {
      _$_KuranViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isErrorToggle(bool value) {
    final _$actionInfo = _$_KuranViewModelBaseActionController.startAction(
        name: '_KuranViewModelBase.isErrorToggle');
    try {
      return super.isErrorToggle(value);
    } finally {
      _$_KuranViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isLoadingToggle(bool value) {
    final _$actionInfo = _$_KuranViewModelBaseActionController.startAction(
        name: '_KuranViewModelBase.isLoadingToggle');
    try {
      return super.isLoadingToggle(value);
    } finally {
      _$_KuranViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts},
sureLink: ${sureLink},
getSure: ${getSure},
sureAd: ${sureAd},
isError: ${isError},
isLoading: ${isLoading}
    ''';
  }
}

// Mocks generated by Mockito 5.4.4 from annotations
// in marvel_heroes/test/presentation/pages/hero_list/hero_list_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:marvel_heroes/core/domain/usecase.dart' as _i5;
import 'package:marvel_heroes/domain/entity/character.dart' as _i7;
import 'package:marvel_heroes/domain/repository/character_repository.dart'
    as _i2;
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart'
    as _i6;
import 'package:marvel_heroes/domain/usecase/get_characters_total_usecase.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCharacterRepository_0 extends _i1.SmartFake
    implements _i2.CharacterRepository {
  _FakeCharacterRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetCharactersTotalUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCharactersTotalUsecase extends _i1.Mock
    implements _i3.GetCharactersTotalUsecase {
  @override
  _i4.Future<int> call(_i5.NoParams? params) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
}

/// A class which mocks [FetchCharactersUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchCharactersUsecase extends _i1.Mock
    implements _i6.FetchCharactersUsecase {
  @override
  _i2.CharacterRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCharacterRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCharacterRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.CharacterRepository);

  @override
  _i4.Future<List<_i7.Character>> call(_i6.FetchCharactersParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i4.Future<List<_i7.Character>>.value(<_i7.Character>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i7.Character>>.value(<_i7.Character>[]),
      ) as _i4.Future<List<_i7.Character>>);
}

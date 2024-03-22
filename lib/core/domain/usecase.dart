import 'package:equatable/equatable.dart';

/// Base class for all use cases
// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  /// Executes the use case
  Future<Type> call(Params params);
}

/// No parameters use case
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

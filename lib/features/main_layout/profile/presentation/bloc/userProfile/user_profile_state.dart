import 'package:equatable/equatable.dart';
import '../../../../../../domain/entities/user.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}
class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  final int watchListCount;
  final int historyCount;
  const ProfileLoaded(this.user, this.watchListCount, this.historyCount);
  @override
  List<Object?> get props => [user, watchListCount, historyCount];
}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final String message;
  const ProfileUpdated(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileDeleting extends ProfileState {}

class ProfileDeleted extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
  @override
  List<Object?> get props => [message];
}

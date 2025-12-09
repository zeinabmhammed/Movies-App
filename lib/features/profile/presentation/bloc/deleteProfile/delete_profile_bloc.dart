import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/profileUsecases/delete_account.dart';
import 'delete_profile_event.dart';
import 'delete_profile_state.dart';

class DeleteProfileBloc extends Bloc<DeleteProfileEvent, DeleteProfileState> {
  final DeleteUserProfileUseCase deleteProfileUseCase;

  DeleteProfileBloc({required this.deleteProfileUseCase})
      : super(DeleteProfileInitial()) {
    on<DeleteProfileRequested>((event, emit) async {
      emit(DeleteProfileLoading());
      try {
        await deleteProfileUseCase.call();
        emit(DeleteProfileSuccess());
      } catch (e) {
        emit(DeleteProfileFailure(e.toString()));
      }
    });
  }
}
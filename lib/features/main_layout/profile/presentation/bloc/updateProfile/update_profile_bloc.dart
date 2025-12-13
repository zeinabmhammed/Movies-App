import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/usecases/profileUsecases/update_profile.dart';
import 'package:movies_app/features/main_layout/profile/presentation/bloc/updateProfile/update_profile_event.dart';
import 'package:movies_app/features/main_layout/profile/presentation/bloc/updateProfile/update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileBloc({required this.updateProfileUseCase}) : super(UpdateProfileInitial()) {
    on<UpdateProfileRequested>((event, emit) async {
      emit(UpdateProfileLoading());
      try {
        final message = await updateProfileUseCase.call(
          name: event.name,
          phone: event.phone,
          imageId: event.imageId,
        );
        emit(UpdateProfileSuccess(message));
      } catch (e) {
        emit(UpdateProfileFailure(e.toString()));
      }
    });
  }
}
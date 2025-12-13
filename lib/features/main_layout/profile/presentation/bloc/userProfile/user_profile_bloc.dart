import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main_layout/profile/presentation/bloc/userProfile/user_profile_event.dart';
import 'package:movies_app/features/main_layout/profile/presentation/bloc/userProfile/user_profile_state.dart';
import '../../../../../../domain/usecases/historyusecases/get_history.dart';
import '../../../../../../domain/usecases/profileUsecases/delete_account.dart';
import '../../../../../../domain/usecases/profileUsecases/get_user_profile.dart';
import '../../../../../../domain/usecases/profileUsecases/update_profile.dart';
import '../../../../../../domain/usecases/watchListUsecases/get_watchList.dart';

class UserProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUseCase getUserProfile;
  final GetHistoryUseCase getHistoryUseCase;
  final GetWatchListUseCase getWatchListUseCase;
  final DeleteUserProfileUseCase deleteProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  UserProfileBloc({
    required this.getUserProfile,
    required this.getHistoryUseCase,
    required this.getWatchListUseCase,
    required this.deleteProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        final user = await getUserProfile.call();

        final historyList = await getHistoryUseCase.call();
        final watchList = await getWatchListUseCase.call();

        emit(ProfileLoaded(user, watchList.length, historyList.length));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileUpdating());
      try {
        final message = await updateProfileUseCase.call(
          name: event.name,
          phone: event.phone,
          imageId: event.imageId,
        );
        emit(ProfileUpdated(message));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<DeleteProfileEvent>((event, emit) async {
      emit(ProfileDeleting());
      try {
        await deleteProfileUseCase.call();
        emit(ProfileDeleted());
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}

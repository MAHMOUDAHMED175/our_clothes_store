import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_clothes_store/features/customer/home/data/repos/home_repo.dart';

part 'get_banners_event.dart';
part 'get_banners_state.dart';
part 'get_banners_bloc.freezed.dart';

class GetBannersBloc extends Bloc<GetBannersEvent, GetBannersState> {
  GetBannersBloc(this._repo) : super(const GetBannersState.loading()) {
    on<FetchBannersEvent>(_getBanners);
  }

  final HomeRepo _repo;

  FutureOr<void> _getBanners(
    FetchBannersEvent event,
    Emitter<GetBannersState> emit,
  ) async {
    emit(const GetBannersState.loading());

    final result = await _repo.getBanners();

    result.when(
      success: (data) {
        if (data.bannerImageList.isNotEmpty) {
          emit(GetBannersState.success(imageBannerList: data.bannerImageList));
          print("banner is SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
          
        } else {
          emit(const GetBannersState.empty());
          print("banner is empty");
        }
      },
      failure: (error) {
        emit(GetBannersState.error(error: error));
      },
    );
  }
}

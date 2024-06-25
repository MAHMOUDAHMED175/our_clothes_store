import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_clothes_store/core/services/dynamic_link/dynamic_link.dart';
import 'package:share_plus/share_plus.dart';

part 'share_state.dart';
part 'share_cubit.freezed.dart';

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(const ShareState.initial());

  Future<void> sendDynamicLinkProduct({
    required String imageUrl,
    required String title,
    required int productId,
  }) async {
    emit(ShareState.loading(productId: productId));

    await BitlyService()
        .shortenUrl(title: title, imageUrl: imageUrl, idpro: productId)
        .then((t) {
      Share.share(t.toString());
    }).catchError((e) {
      print(e.toString());
    });

    emit(const ShareState.success());
  }
}

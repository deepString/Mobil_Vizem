import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  sepeteEkle({required int id, required String colorName, required var color, required String photo, required String ad, required int sayi, required double fiyat}) {
    var suankiSepet = state.sepet;

    if (suankiSepet.any((element) => element["id"] == id)) {
      suankiSepet.firstWhere((element) => element["id"] == id)["count"]++;
    }
    else {
      suankiSepet.add({
      "id": id,
      "name": ad,
      "photo": photo,
      "count": sayi,
      "price": fiyat,
      "color": color,
      "colorName": colorName,
    });
    }

    final newState = CartState(
      sepet: suankiSepet,
    );

    emit(newState);
  }

  sepettenCikart({required int id}) {
    var suankiSepet = state.sepet;

    suankiSepet.removeWhere((element) => element["id"] == id);

    final newState = CartState(
      sepet: suankiSepet,
    );

    emit(newState);
  }

  sepetiBosalt() {
    final newState = CartState(
      sepet: [],
    );

    emit(newState);
  }
}

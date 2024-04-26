import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(super.initialState);

  addToFavorites(Map<String, dynamic> product) {
    var currentFavorites = state.favoritesProducts;

    bool found = false;

    for (int i = 0; i < currentFavorites.length; i++) {
      if (currentFavorites[i]["id"] == product["id"]) {
        found = true;
        break;
      }
    }

    if (found == true) {
      // Ürün zaten var tekrar eklemeyeceğiz
    } 
    else {
      currentFavorites.add(product);
      final updatedState = FavoritesState(
        favoritesProducts: currentFavorites,
      );

      emit(updatedState);
    }
  }

  bool isFavorite(int productId) {
    return state.favoritesProducts.any((element) => element["id"] == productId);
  }

  removeFromFavorites(int productId) {
    var currentFavorites = state.favoritesProducts;

    currentFavorites.removeWhere((element) => element["id"] == productId);

    final newState = FavoritesState(favoritesProducts: currentFavorites);

    emit(newState);
  }

  clearFavorites() {
    final updatedState = FavoritesState(
      favoritesProducts: const [],
    );

    emit(updatedState);
  }
}

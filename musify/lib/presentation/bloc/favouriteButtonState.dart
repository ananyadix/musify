abstract class FavouriteButtonState{

}

class FavouriteButtonInitial extends FavouriteButtonState{

}

class FavouriteButtonUpdate extends FavouriteButtonState{
  final bool isFav;

  FavouriteButtonUpdate({required this.isFav});

}

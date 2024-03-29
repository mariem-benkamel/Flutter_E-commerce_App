// part of 'wishlist_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/wishlist_model.dart';

@immutable
abstract class WishlistState extends Equatable {
  const WishlistState();
}

class WishlistLoading extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;

  const WishlistLoaded({this.wishlist = const Wishlist()});

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {
  @override
  List<Object> get props => [];
}

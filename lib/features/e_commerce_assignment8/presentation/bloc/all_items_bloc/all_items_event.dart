part of 'all_items_bloc.dart';

abstract class AllItemsEvent extends Equatable {
  const AllItemsEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends AllItemsEvent {
  final PlantEntity item;
  const OnTapEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class AddToCartEvent extends AllItemsEvent {
  final PlantEntity item;
  const AddToCartEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class RemoveFromCartEvent extends AllItemsEvent {
  final PlantEntity item;
  const RemoveFromCartEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class FetchAllItemsEvent extends AllItemsEvent {
  // final List<PlantEntity> itemList;
  // FetchAllItemsEvent(this.itemList);

  // @override
  // List<Object> get props => [itemList];
}

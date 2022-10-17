part of 'all_items_bloc.dart';

abstract class AllItemsState {
  const AllItemsState();

  @override
  List<Object> get props => [];
}

class AllItemsInitial extends AllItemsState {}

class AllItemsLoading extends AllItemsState {}

class AllItemsLoadedState extends AllItemsState {
  final List<PlantEntity> allItems;
  const AllItemsLoadedState({required this.allItems});
  @override
  List<Object> get props => [allItems];
}

class ErrorState extends AllItemsState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

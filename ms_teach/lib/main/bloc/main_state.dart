part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  final List<MainItem> items;

  const MainState({required this.items});

  @override
  List<Object?> get props => [items];
}

class MainInitial extends MainState {
  const MainInitial({required super.items});
}

class MainUpdated extends MainState {
  const MainUpdated({required super.items});
}

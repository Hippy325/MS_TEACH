import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/main/models/main_item.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  List<MainItem> items = [
    MainItem(
      title: 'Mountain',
      imageUrl: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
    ),
    MainItem(
      title: 'Forest',
      imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e',
    ),
    MainItem(
      title: 'Ocean',
      imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    ),
    MainItem(
      title: 'City',
      imageUrl: 'https://images.unsplash.com/photo-1514565131-fce0801e5785',
    ),
    MainItem(
      title: 'Desert',
      imageUrl: 'https://images.unsplash.com/photo-1509316785289-025f5b846b35',
    ),
  ];

  MainBloc() : super(MainInitial(items: [])) {
    on<MainOnAppear>((event, emit) {
      emit(MainUpdated(items: items));
    });
  }
}

import 'package:equatable/equatable.dart';

class MainItem extends Equatable {
  final String title;
  final String imageUrl;

  const MainItem({required this.title, required this.imageUrl});

  @override
  List<Object?> get props => [title, imageUrl];
}

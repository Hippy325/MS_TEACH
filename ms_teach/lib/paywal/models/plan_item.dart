import 'package:equatable/equatable.dart';

class PlanItem extends Equatable {
  final String title;
  final String price;
  final String? badge;
  final bool selected;

  const PlanItem({
    required this.title,
    required this.price,
    this.badge,
    this.selected = false,
  });

  @override
  List<Object?> get props => [title, price, badge, selected];

  PlanItem copyWith({
    String? title,
    String? price,
    String? badge,
    bool? selected,
  }) {
    return PlanItem(
      title: title ?? this.title,
      price: price ?? this.price,
      badge: badge ?? this.badge,
      selected: selected ?? this.selected,
    );
  }
}

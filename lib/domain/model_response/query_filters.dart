import 'package:equatable/equatable.dart';

class FilterParams extends Equatable {
  final String? search;
  final int limit;

  final String? category;

  const FilterParams({
    this.search,
    this.limit = 20,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {'search': search, 'type': category, 'limit': limit};
  }

  FilterParams copyWith({
    int? limit,
    String? category,
    String? search,
  }) {
    return FilterParams(
      category: category ?? this.category,
      limit: limit ?? this.limit,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [search, category, limit];
}

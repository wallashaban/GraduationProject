import '../../../core/utils/exports.dart';

class General extends Equatable {
  final String? data;
  final String message;
  final bool status;
  const General({
    required this.data,
    required this.message,
    required this.status,
  });
  @override
  List<Object?> get props => [
        data,
        message,
        status,
      ];
}

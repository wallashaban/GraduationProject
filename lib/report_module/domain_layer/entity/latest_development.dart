import 'package:graduation_project/core/utils/exports.dart';

class LatestDevelopment extends Equatable {
  final List question;

  const LatestDevelopment({
    required this.question,
  });
  @override
  List<Object?> get props => [
        question,
      ];
}

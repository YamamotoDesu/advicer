import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {},
    );
    return right(
      const AdviceEntity(
        advice: 'advice to test',
        id: 1,
      ),
    );
  }
}

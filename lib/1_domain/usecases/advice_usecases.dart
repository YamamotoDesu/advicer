import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}

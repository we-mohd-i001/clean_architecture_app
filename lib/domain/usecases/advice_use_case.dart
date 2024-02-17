import 'package:clean_architecture_app/domain/entities/advice_entity.dart';

class AdviceUseCase {
  Future<AdviceEntity> getAdvice() async {
    await Future.delayed(const Duration(seconds: 1));
    return AdviceEntity(adviceMessage: 'Fake advice entity message!', id: 1);
  }
}

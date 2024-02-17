import 'package:clean_architecture_app/domain/usecases/advice_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    final AdviceUseCase adviceUseCase = AdviceUseCase();
    on<AdviceRequestedEvent>((event, emit) async {
      print('Fake advice triggered!');
      emit(AdviserStateLoading());
      final failOrAdviceEntity = await adviceUseCase.getAdvice();
      await Future.delayed(const Duration(seconds: 3), () {
        print('waiting for 3 seconds...');
      });
      failOrAdviceEntity.fold(
          (failure) => emit(AdviserStateError('Test error!')),
          (advice) => emit(AdviserStateLoaded(advice.adviceMessage)));
    });
  }
}

import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:clean_architecture_app/domain/usecases/advice_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

const String generalFailureMessage = 'Oops! Something went wrong!';
const String cacheFailureMessage = 'Oops! cache failed!';
const String serverFailureMessage = 'Oops! Server error!';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  final AdviceUseCase adviceUseCase;
  AdviserBloc({required this.adviceUseCase}) : super(AdviserInitial()) {

    on<AdviceRequestedEvent>((event, emit) async {
      String _mapFailureToMessage(Failures failure) {
        switch (failure.runtimeType) {
          case ServerFailure:
            return serverFailureMessage;
          case CacheFailure:
            return cacheFailureMessage;
          default:
            return generalFailureMessage;
        }
      }
      emit(AdviserStateLoading());
      final failOrAdviceEntity = await adviceUseCase.getAdvice();
      failOrAdviceEntity.fold(
          (failure) => emit(AdviserStateError(_mapFailureToMessage(failure))),
          (advice) => emit(AdviserStateLoaded(advice.adviceMessage)));
    });
  }
}

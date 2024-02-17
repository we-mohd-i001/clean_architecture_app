import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviserStateLoading());
      print('Fake advice triggered!');
      await Future.delayed(Duration(seconds: 3), () {});
      emit(AdviserStateLoaded('Fake advice for testing bloc!'));
      emit(AdviserStateError('Test erro!'));
    });
  }
}

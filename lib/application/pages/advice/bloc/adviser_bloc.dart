import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      print('Fake advice triggered!');
      emit(AdviserStateLoading());
      await Future.delayed(const Duration(seconds: 3), () {
        print('waiting for 3 seconds...');
      });
      emit(AdviserStateLoaded('Fake advice for testing bloc!'));
      //emit(AdviserStateError('Test error!'));
    });
  }
}

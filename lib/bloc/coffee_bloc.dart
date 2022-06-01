import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/coffe_model.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeInitial()) {
    on<LoadCoffeCounter>((event, emit)async {
      await Future<void>.delayed(const Duration(seconds: 1),);
      emit( CoffeeLoaded(coffees: <Coffe>[],),);
    },);
    on<AddCoffe>((event, emit) {
      if(state is CoffeeLoaded){
        final state = this.state as CoffeeLoaded;
        emit(
          CoffeeLoaded(coffees: List.from(state.coffees)..add(event.coffe),),
        );
      }
    },);
    on<RemoveCoffe>((event, emit) {
      if(state is CoffeeLoaded){
        final state = this.state as CoffeeLoaded;
        emit(CoffeeLoaded(coffees: List.from(state.coffees)..remove(event.coffe),),);
      }
    },);
  }
}

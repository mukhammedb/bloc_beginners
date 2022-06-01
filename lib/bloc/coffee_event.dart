part of 'coffee_bloc.dart';

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();

  @override
  List<Object> get props => [];
}

class LoadCoffeCounter extends CoffeeEvent {}

class AddCoffe extends CoffeeEvent {
  final Coffe coffe;

  const AddCoffe(this.coffe);
  
  @override 
  List<Object> get props => [];
}


class RemoveCoffe extends CoffeeEvent {
  final Coffe coffe;

  const RemoveCoffe(this.coffe);
  
  @override 
  List<Object> get props => [];
}

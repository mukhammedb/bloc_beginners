part of 'coffee_bloc.dart';

abstract class CoffeeState extends Equatable {
  const CoffeeState();
  
  @override
  List<Object> get props => [];
}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final List<Coffe> coffees;

  CoffeeLoaded({required this.coffees});

  @override 
  List<Object> get props => [coffees];
}

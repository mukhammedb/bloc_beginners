import 'dart:math';

import 'package:bloc_beginners/bloc/coffee_bloc.dart';
import 'package:bloc_beginners/models/coffe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('The Coffee bloc'),
      centerTitle:true, backgroundColor: Colors.deepPurple,),
      body: Center(
        child: BlocBuilder<CoffeeBloc, CoffeeState>(
          builder: ((context, state) {
           if (state is CoffeeInitial) {
             return const CircularProgressIndicator(color: Colors.deepPurple,);
           }
           if (state is CoffeeLoaded){
             return Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('${state.coffees.length}', 
                 style: const TextStyle(fontSize: 69,
                 fontWeight: FontWeight.bold,),),
                 const SizedBox(height: 25,),
                 SizedBox(height: MediaQuery.of(context).size.height / 1.5,
                 width: MediaQuery.of(context).size.width,
                 child: Stack(
                   alignment: Alignment.center,
                   clipBehavior: Clip.none,
                   children: [
                   for (int index = 0;
                        index <state.coffees.length;
                        index++)
                      Positioned(
                        // left: Random.nextInt(250).toDouble(),
                        // top: Random.nextInt(400).toDouble(),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: state.coffees[index].image,) )
                 ]),)
               ],
             );
           }else {
             return const Text('Something went wrong!');
           }
          }),
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton(
          child: const Icon(Icons.local_cafe_outlined),
          backgroundColor: Colors.deepPurple[200],
          onPressed: (() {
          context.read<CoffeeBloc>().add(AddCoffe(Coffe.coffes[0]));
        }
        ),),
        const SizedBox(height: 10,),
        FloatingActionButton(
          child: const Icon(Icons.clear),
          backgroundColor: Colors.deepPurple[200],
          onPressed: (() {
          context.read<CoffeeBloc>().add(RemoveCoffe(Coffe.coffes[0]));
        }
        ),),
        const SizedBox(height: 10,),
        FloatingActionButton(
          child: const Icon(Icons.local_cafe_outlined),
          backgroundColor: Colors.deepPurple[200],
          onPressed: (() {
          context.read<CoffeeBloc>().add(AddCoffe(Coffe.coffes[1]));
        }
        ),),
         const SizedBox(height: 10,),
        FloatingActionButton(
          child: const Icon(Icons.clear),
          backgroundColor: Colors.deepPurple[200],
          onPressed: (() {
          context.read<CoffeeBloc>().add(RemoveCoffe(Coffe.coffes[1]));
        }
        ),),
        ]),
      
   ); 
  }
}
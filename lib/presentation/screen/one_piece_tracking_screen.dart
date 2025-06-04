import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_care/presentation/cubit/login_cubit.dart';
import 'package:money_care/presentation/cubit/one_piece_cubit.dart';

class OnePieceTrackingScreen extends StatefulWidget {
  const OnePieceTrackingScreen({super.key});

  @override
  State<OnePieceTrackingScreen> createState() => _OnePieceTrackingScreen();
}

class _OnePieceTrackingScreen extends State<OnePieceTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => OnePieceCubit()),
      ],
      child: OnePieceTrackingPage(),
    );
  }
}

class OnePieceTrackingPage extends StatelessWidget {
  const OnePieceTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    OnePieceCubit onePieceCubit = context.read<OnePieceCubit>();
    var state = loginCubit.state;
    var isAdmin = false;
    if (state is LogIn) {
      isAdmin = state.user.email == "hoangthien66771508@gmail.com";
    }
    // if (state is NotLogIn || !isAdmin) {
    //   navigate(context, MyRoute.login);
    // }

    return BlocBuilder<OnePieceCubit, OnePieceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("One piece Book tracking")),
          body: Column(
            children: [
              Expanded(
                child: GridView.extent(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  maxCrossAxisExtent: 150,
                  padding: EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children:
                      onePieceCubit.state.bookSeries.read.mapIndexed((id, it) {
                        return GestureDetector(
                          onTap: () {
                            context.read<OnePieceCubit>().edit(id, !it);
                          },
                          child: Container(
                            color: it ? Colors.amber : Colors.grey,
                            child: Center(child: Text("Book $id")),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

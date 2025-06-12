import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_care/core/service_locator.dart';
import 'package:money_care/presentation/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<LoginCubit>(),
      child: _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  Widget _loginState() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();
        if (state is LogIn) {
          return Column(
            children: [
              ListTile(
                leading: Image.network(state.user.photoURL.toString(), width: 16, height: 16,),
                title: Text(state.user.displayName.toString()),
              ),
              ListTile(title: Text(state.user.email.toString())),
              ListTile(title: Text(state.user.providerData.first.providerId)),
              ListTile(title: Text(state.user.uid.toString())),
              GestureDetector(
                onTap: () {
                  cubit.logOut();
                },
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log out"),
                ),
              ),
            ],
          );
        }
        return Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  cubit.googleLogin();
                },
                child: Text("Login with Google"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Sign Up with Email/Password"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Login with Email/Password"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User")),
      body: Column(children: [_loginState()]),
    );
  }
}

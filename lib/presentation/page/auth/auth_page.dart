import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_tracker/data/di/injection.dart';
import 'package:work_tracker/data/source/auth/auth_data_source_imp.dart';
import 'package:work_tracker/domain/bloc/auth/auth_bloc.dart';
import 'package:work_tracker/presentation/routes/app_routes.dart';
import 'package:work_tracker/presentation/widgets/snak_widget.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(di<AuthDataSourceImp>()),
      child: Scaffold(
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  showSnack(context: context, title: state.message);
                }

                if (state is Authenticated) {
                  context.goNamed(AppPath.home);
                }
              },
              builder: (context, state) {
                return state.isLoginMode
                    ? _loginWidget(context, state)
                    : _signupWidget(context, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _loginWidget(BuildContext context, AuthState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          obscureText: true,
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthSignInEvent(
                  email: _emailController.text,
                  password: _passwordController.text));
            },
            style: ElevatedButton.styleFrom(),
            child: const Text("Login")),
        const SizedBox(
          height: 25,
        ),
        RichText(
            text: TextSpan(children: [
          const TextSpan(
            text: 'Don\'t have account ? ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Signup',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<AuthBloc>().add(const AuthToggleModeEvent());
              },
          )
        ]))
      ],
    );
  }

  Column _signupWidget(BuildContext context, AuthState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          obscureText: true,
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthSignUpEvent(
                  email: _emailController.text,
                  password: _passwordController.text));
            },
            style: ElevatedButton.styleFrom(),
            child: const Text("SignUp")),
        const SizedBox(
          height: 25,
        ),
        RichText(
            text: TextSpan(children: [
          const TextSpan(
            text: 'Have account ? ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'SignIn',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<AuthBloc>().add(const AuthToggleModeEvent());
              },
          )
        ]))
      ],
    );
  }
}

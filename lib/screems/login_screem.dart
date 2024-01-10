import "package:flutter/material.dart";
import "package:med_app/providers/login_form_provider.dart";
import "package:med_app/ui/input_decorations.dart";
import "package:med_app/widgets/widgets.dart";
import "package:provider/provider.dart";

class LoginScreem extends StatefulWidget {
  const LoginScreem({super.key});

  @override
  State<LoginScreem> createState() => _LoginScreemState();
}

class _LoginScreemState extends State<LoginScreem> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 250),
          CardContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text('Login',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (BuildContext context) => LoginFormProvider(),
                    child: _LoginForm())
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Crear Nueva Cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
        ]),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'alguien@correo.com',
                labelText: 'Usuario',
                prefixIcon: Icons.alternate_email_sharp),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor no tiene formato de correo';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline_sharp),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Password debe llevar 6 caracteres o mas';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      if (!loginForm.isValidForm()) return;

                      loginForm.isLoading = true;

                      await Future.delayed(const Duration(seconds: 2));

                      loginForm.isLoading = false;

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, 'home_screem');
                    },
              child: Text(
                loginForm.isLoading ? 'Cargando....' : 'Ingresar',
                style: const TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

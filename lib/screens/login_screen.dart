import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reagenda/block/login_bloc.dart';
import 'package:reagenda/screens/home_screen.dart';
import 'package:reagenda/widgets/input_field.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state){
      switch(state){
        case LoginState.SUCESS:
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case LoginState.FAIL:
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("Erro"),
            content: Text("Você não possui acesso ao sistema, verifique seus dados ou contate o suporte"),
          ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });



  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<LoginState>(
        stream: _loginBloc.outState,
        initialData: LoginState.LOADING,
        // ignore: missing_return
        builder: (context, snapshot) {
          switch(snapshot.data){
            case LoginState.LOADING:
              return Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.yellowAccent.withAlpha(160)),),);
            case LoginState.FAIL:
            case LoginState.SUCESS:
            case LoginState.IDLE:
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                Container(),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.store_mall_directory,
                          color: Colors.limeAccent.withAlpha(160),
                          size: 160,
                        ),
                        InputField(
                          icon: Icons.person_outline,
                          hint: "Usuário",
                          obscure: false,
                          stream: _loginBloc.outEmail,
                          onChanged: _loginBloc.changeEmail,
                        ),
                        InputField(
                          icon: Icons.lock_outline,
                          hint: "Senha",
                          obscure: true,
                          stream: _loginBloc.outPassword,
                          onChanged: _loginBloc.changePassword,
                        ),
                        SizedBox(height: 32,),
                        StreamBuilder<bool>(
                            stream: _loginBloc.outSubmitValid,
                            builder: (context, snapshot) {
                              return SizedBox(
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.yellowAccent,
                                  child: Text("Entrar"),
                                  onPressed: snapshot.hasData ? _loginBloc.submit : null,
                                  textColor: Colors.white,
                                  disabledColor: Colors.yellowAccent.withAlpha(140),
                                ),
                              );
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          };
        }
      ),
    );
  }
}

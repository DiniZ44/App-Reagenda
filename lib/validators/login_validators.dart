import 'dart:async';
class LoginValidators{

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@")){
      sink.add(email);
      }else
        sink.addError("Insira um e-mail válido");
    }
  );

  final validateSenha = StreamTransformer<String, String>.fromHandlers(
      handleData: (senha, sink){
        if(senha.length > 4){
          sink.add(senha);
        }else
          sink.addError("Senha inválida!");
      }
  );
}
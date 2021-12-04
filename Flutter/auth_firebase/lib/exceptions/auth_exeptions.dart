class AuthException implements Exception {
  final String key;
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já Cadastrado',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Acesso Bloqueado temporariamente, Tente mais tarde',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado',
    'INVALID_PASSWORD': 'Senha informada não confere',
    'USER_DISABLED': 'A conta do usúario foi desabilitada',
  };

  AuthException({required this.key});

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação';
  }
}

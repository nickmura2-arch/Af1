// Exercício 1:

class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;

  Passageiro({this.nome, this.cpf, this.rg, this.email, this.celular});
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;

  PlataformaVenda({this.codigoCanal, this.nomeCanal});
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;

  Atendente({
    this.nome,
    this.matricula,
    this.cargo,
    this.email,
    this.celular,
    this.salario,
  });
}

// Exercício 9: Mixins[cite: 1]

mixin Logger {
  void log(String mensagem) {
    print("[LOG]: $mensagem");
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print("[Auditoria]: $mensagem");
  }
}

// Exercícios 2, 3, 4, 5, 6 e 7: Classe Passagem[cite: 1]

class Passagem {
  // Exercício 2 & 5: Encapsulamento de Atributos Críticos[cite: 1]
  String? _codigoLocalizador = "";
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // Exercício 2: Construtor Não Nomeado[cite: 1]
  Passagem();

  // Exercício 3: Construtores Nomeados[cite: 1]
  Passagem.somenteCodigo(String codigoLocalizador) {
    this._codigoLocalizador = codigoLocalizador;
  }

  Passagem.completa(
    String codigoLocalizador,
    this.passageiro,
    this.plataforma,
    this.atendente,
    this.observacoes,
  ) {
    this._codigoLocalizador = codigoLocalizador;
  }

  // Exercício 4: Parâmetros Nomeados e Clareza de Inicialização[cite: 1]
  Passagem.codigoEPassageiro({String? codigoLocalizador, this.passageiro}) {
    this._codigoLocalizador = codigoLocalizador ?? "";
  }

  Passagem.all(
    String codigoLocalizador, {
    required Passageiro passageiro,
    required PlataformaVenda plataforma,
    required Atendente atendente,
    String? observacoes,
  }) {
    this._codigoLocalizador = codigoLocalizador;
    this.passageiro = passageiro;
    this.plataforma = plataforma;
    this.atendente = atendente;
    this.observacoes = observacoes;
  }

  // Exercício 5: Métodos Tradicionais de Getter e Setter[cite: 1]
  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 6: Getters e Setters nativos do Dart[cite: 1]
  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 7: Comportamentos e Métodos de Negócio[cite: 1]
  void emitirPassagem() {
    print("Passagem emitida com sucesso!");
  }

  bool cancelarPassagem() {
    print("Passagem cancelada com sucesso!");
    return true;
  }

  void atualizarPassagem() {
    print("Passagem atualizada com sucesso!");
  }

  Passagem consultarPassagem(String codigo) {
    print("Passagem consultada com sucesso!");
    return Passagem();
  }
}

// ==========================================
// Exercício 8, 9 e 10: Herança, Mixins e Polimorfismo[cite: 1]
// ==========================================

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  // Exercício 8: Construtor especializado chamando a superclasse[cite: 1]
  PassagemPrimeiraClasse(
    String codigoLocalizador,
    Passageiro passageiro,
    PlataformaVenda plataforma,
    Atendente atendente,
    String? observacoes, {
    required this.loungeAcesso,
  }) : super.all(
         codigoLocalizador,
         passageiro: passageiro,
         plataforma: plataforma,
         atendente: atendente,
         observacoes: observacoes,
       );

  // Exercício 10: Sobrescrita Polimórfica[cite: 1]
  @override
  void atualizarPassagem() {
    print("Passagem de Primeira Classe atualizada com sucesso!");
    
    // Chamadas aos métodos recebidos dos mixins[cite: 1]
    String nomeAtendente = atendente?.nome ?? "Atendente Não Informado";
    log("Alteração realizada pelo atendente: $nomeAtendente");
    auditar("Verificação de segurança realizada para a Primeira Classe.");
  }
}

// ==========================================
// Exercício 10: Função Main (Execução Geral)[cite: 1]
// ==========================================

void main() {
  print("=== SISTEMA DE EMISSÃO DE PASSAGENS SKYHORIZON ===\n");

  // Instanciando objetos de apoio
  var pas1 = Passageiro(
    nome: "Carlos Eduardo",
    cpf: "123.456.789-00",
    rg: "12.345.678-9",
    email: "carlos@email.com",
    celular: "(11) 99999-8888",
  );

  var plat1 = PlataformaVenda(
    codigoCanal: 101,
    nomeCanal: "App Mobile SkyHorizon",
  );

  var ate1 = Atendente(
    nome: "Fernanda Lima",
    matricula: "ATE-2026",
    cargo: "Agente de Aeroporto",
    email: "fernanda.lima@skyhorizon.com",
    celular: "(11) 97777-6666",
    salario: 4500.0,
  );

  // 1. Passagem Padrão (Construtor Não Nomeado / Instanciação Básica)[cite: 1]
  print("--- 1. Teste Passagem Padrão ---");
  var passagemSimples = Passagem();
  passagemSimples.codigoLocalizador = "SKY123"; // Testando setter nativo[cite: 1]
  print("Código Localizador: ${passagemSimples.codigoLocalizador}");
  passagemSimples.emitirPassagem(); // Testando método de negócio[cite: 1]

  // Teste de Validação do Setter (Valor Inválido)[cite: 1]
  print("\n--- Teste de Validação de Encapsulamento ---");
  passagemSimples.codigoLocalizador = ""; // Deve disparar mensagem de erro[cite: 1]

  // 2. Passagem utilizando o Construtor .all com Parâmetros Nomeados[cite: 1]
  print("\n--- 2. Teste Passagem.all ---");
  var passagemCompleta = Passagem.all(
    "SKY999",
    passageiro: pas1,
    plataforma: plat1,
    atendente: ate1,
    observacoes: "Assento na janela e refeição vegana",
  );
  print("Passagem criada para: ${passagemCompleta.passageiro?.nome}");
  passagemCompleta.atualizarPassagem();

  // 3. Passagem de Primeira Classe (Especialização, Mixins e Polimorfismo)[cite: 1]
  print("\n--- 3. Teste Passagem Primeira Classe (VIP) ---");
  var passagemVip = PassagemPrimeiraClasse(
    "VIP777",
    pas1,
    plat1,
    ate1,
    "Solicitou transporte privativo",
    loungeAcesso: "Lounge VIP Internacional - Terminal 3",
  );

  print("Lounge de Acesso: ${passagemVip.loungeAcesso}");
  
  // Executando o método sobrescrito com chamadas de Log e Auditoria[cite: 1]
  passagemVip.atualizarPassagem();
  
  print("\n=== OPERAÇÃO CONCLUÍDA COM SUCESSO ===");
}
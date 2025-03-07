class Funcionario {
  final int id; 
  String nome;
  String cargo;
  double _salario; 

  Funcionario(this.id, this.nome, this.cargo, this._salario);

  double get salario {
    return _salario;
  }

  set salario(double valor) {
    if (valor > _salario) {
      _salario = valor;
    } else {
      print("O aumento salarial deve ser maior que o salário atual.");
    }
  }

  void aumentarSalario(double percentual) {
    if (percentual > 0) {
      _salario += _salario * (percentual / 100);
    } else {
      print("Percentual de aumento deve ser positivo.");
    }
  }

  void exibirInformacoes() {
    print("ID: $id, Nome: $nome, Cargo: $cargo, Salário: \$$_salario");
  }
}

class Empresa {
  List<Funcionario> clt = [];

  void adicionarFuncionario(Funcionario funcionario) {
    clt.add(funcionario);
  }

  void removerFuncionario(int id) {
    clt.removeWhere((func) => func.id == id);
  }

  void listarFuncionarios() {
    if (clt.isEmpty) {
      print('Não há funcionários na empresa.');
    } else {
      print('Funcionários da empresa:');
      for (var funcionario in clt) {
        funcionario.exibirInformacoes();
      }
    }
  }
}

void main() {
  var empresa = Empresa();

  var func1 = Funcionario(1, 'João', 'Desenvolvedor', 3000.0);
  var func2 = Funcionario(2, 'Maria', 'Gerente', 5000.0);
  var func3 = Funcionario(3, 'Carlos', 'Designer', 3500.0);

  empresa.adicionarFuncionario(func1);
  empresa.adicionarFuncionario(func2);
  empresa.adicionarFuncionario(func3);

  print("Antes do aumento:");
  empresa.listarFuncionarios();

  func1.aumentarSalario(10); 
  func2.aumentarSalario(15);
  func3.aumentarSalario(5); 

  print("\nApós o aumento salarial:");
  empresa.listarFuncionarios();

  empresa.removerFuncionario(2); 

  print("\nApós a remoção do funcionário com ID 2:");
  empresa.listarFuncionarios();
}

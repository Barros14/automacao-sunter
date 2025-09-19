from robot.api.deco import keyword
import random

@keyword
def gerar_cpf_valido():
    def calcular_digito(cpf, peso):
        soma = sum(int(digito) * peso[i] for i, digito in enumerate(cpf))
        resto = soma % 11
        return '0' if resto < 2 else str(11 - resto)

    cpf_base = [str(random.randint(0, 9)) for _ in range(9)]
    peso_1 = list(range(10, 1, -1))
    peso_2 = list(range(11, 1, -1))

    digito1 = calcular_digito(cpf_base, peso_1)
    digito2 = calcular_digito(cpf_base + [digito1], peso_2)

    cpf = ''.join(cpf_base + [digito1, digito2])
    return f"{cpf[:3]}.{cpf[3:6]}.{cpf[6:9]}-{cpf[9:]}"

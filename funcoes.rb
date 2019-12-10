# frozen_string_literal: true

def acrescentar_bits_zero(mensagem, gerador)
  r = gerador.length() - 1

  mensagem + ['0'] * r
end

def  mensagem_criptografada(mensagem_com_zeros_acrescentado, gerador)
  mensagem_aux = mensagem_com_zeros_acrescentado.map(&:clone)
  mensagem_dividendo = []
  quociente = []
  resto = []

  mensagem_com_zeros_acrescentado.each do |m|
    break if m == '1'

    mensagem_aux.delete_at(0)
  end

  (0...gerador.length).each do |index|
    mensagem_dividendo.append(mensagem_aux[0])
    mensagem_aux.delete_at(0)
  end

  loop do
    mensagem_dividendo_aux = []
    mensagem_dividendo.each_with_index do |bit, index|
      if bit == gerador[index]
        mensagem_dividendo_aux.append('0')
      else
        mensagem_dividendo_aux.append('1')
      end
    end

    mensagem_dividendo_aux_aux = mensagem_dividendo_aux.map(&:clone)
    mensagem_dividendo_aux.each do |bit|
      break if bit == '1'

      mensagem_dividendo_aux_aux.delete_at(0)
    end

    loop do
      break if mensagem_dividendo_aux_aux.length == gerador.length || mensagem_aux.length.zero?

      mensagem_dividendo_aux_aux.append(mensagem_aux[0])
      mensagem_aux.delete_at(0)
    end

    mensagem_dividendo = mensagem_dividendo_aux_aux.map(&:clone)

    if mensagem_aux.length.zero?
      resto = mensagem_dividendo_aux_aux.map(&:clone)
      break
    end
  end
end

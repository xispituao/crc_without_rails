# frozen_string_literal: true

def acrescentar_bits_zero(mensagem, gerador)
  r = gerador.length() - 1

  mensagem + ['0'] * r
end

def mensagem_criptografada(mensagem_com_zeros_acrescentado, gerador)
  mensagem_aux = mensagem_com_zeros_acrescentado.map(&:clone)
  mensagem_dividendo = []
  resto = []

  mensagem_com_zeros_acrescentado.each do |bit|
    break if bit == '1'

    mensagem_aux.delete_at(0)
  end

  gerador.length.times do
    mensagem_dividendo.append(mensagem_aux[0])
    mensagem_aux.delete_at(0)
  end

  loop do
    mensagem_dividendo.each_with_index do |bit, index|
      mensagem_dividendo[index] = if bit == gerador[index]
                                    '0'
                                  else
                                    '1'
                                  end
    end

    mensagem_dividendo_aux = mensagem_dividendo.map(&:clone)
    mensagem_dividendo.each do |bit|
      break if bit == '1'

      mensagem_dividendo_aux.delete_at(0)
    end

    loop do
      break if mensagem_dividendo_aux.length == gerador.length || mensagem_aux.length.zero?

      mensagem_dividendo_aux.append(mensagem_aux[0])
      mensagem_aux.delete_at(0)
    end

    mensagem_dividendo = mensagem_dividendo_aux.map(&:clone)

    if mensagem_aux.length.zero?
      if mensagem_dividendo.length == gerador.length
        mensagem_dividendo.each_with_index do |bit, index|
          mensagem_dividendo[index] = if bit == gerador[index]
                                        '0'
                                      else
                                        '1'
                                      end
        end
      end

      if mensagem_dividendo.length >= gerador.length
        ((mensagem_dividendo.length - gerador.length) + 1).times do
          mensagem_dividendo.delete_at(0)
        end
      else
        unless gerador.length - mensagem_dividendo.length == 1
          loop do
            mensagem_dividendo.insert(0, 0)

            break if mensagem_dividendo.length == gerador.length - 1
          end
        end
      end
      resto = mensagem_dividendo.map(&:clone)
      break
    end
  end

  resto
end

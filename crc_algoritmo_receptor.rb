require_relative 'funcoes_receptor.rb'

p 'Digite a sequencia de bits que representa a mensagem'
mensagem_original = gets.chomp
mensagem = mensagem_original.split('')
p 'Digite a sequencia de bits que representa o gerador'
gerador_original = gets.chomp
gerador = gerador_original.split('')

caracteres_irregulares_mensagem = mensagem.select { |caractere| caractere != '1' && caractere != '0'}
caracteres_irregulares_gerador = gerador.select { |caractere| caractere != '1' && caractere != '0'}

loop do
  break if caracteres_irregulares_mensagem.nil? || caracteres_irregulares_mensagem.empty?

  p 'Únicos caracteres que podem ser inputados na mensagem são 0 e 1!'
  p 'Digite a sequencia de bits que representa a mensagem'
  mensagem_original = gets.chomp
  mensagem = mensagem_original.split('')
  caracteres_irregulares_mensagem = mensagem.select { |caractere| caractere != '1' && caractere != '0'}
end

loop do
  break if caracteres_irregulares_gerador.nil? || caracteres_irregulares_gerador.empty?

  p 'Únicos caracteres que podem ser inputados no gerador são 0 e 1!'
  p 'Digite a sequencia de bits que representa o gerador'
  gerador_original = gets.chomp
  gerador = gerador_original.split('')
  caracteres_irregulares_gerador = gerador.select { |caractere| caractere != '1' && caractere != '0'}
end

resto = verificar_erro(mensagem, gerador)
conclusao = if resto.include?('1')
              'Mensagem possui erros!'
            else
              'Mensagem sem erros!'
            end

p "Resto: #{resto.join('')}"
p "Mensagem com FCS: #{mensagem_original}"
p "Mesagem original: #{mensagem_original[0, mensagem_original.length - (gerador_original.length - 1)]}"
p "FCS: #{mensagem_original[mensagem_original.length - (gerador_original.length - 1), mensagem_original.length]}"
p conclusao

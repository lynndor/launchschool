require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

loop do
  def prompt(message)
    puts "=> #{message}"
  end

  def integer?(number)
    /^\d+$/.match(number)
  end

  def float?(number)
    /^\d*\.?\d*$/.match(number)
  end

  def number?(input)
    integer?(input) || float?(input)
  end

  def messages(lang, message)
    MESSAGES[lang][message]
  end
  num_1 = ''
  loop do

    prompt(MESSAGES['fist_number']);
    num_1 = Kernel.gets().chomp();

    if number?(num_1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end

  end

  num_2 = ''
  loop do

    prompt(MESSAGES['second_number'])
    num_2 = Kernel.gets().chomp(); 

    if number?(num_2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end

  end

  operation = <<-MSG
  What operation would you like to perform?
  1. add
  2. subract
  3. multiply
  4. divide
  MSG

  operator = ''
 
  loop do

    prompt(operation)
    operator = Kernel.gets().chomp()

    if integer?(operator)
      break
    else
      prompt(MESSAGES['valid_number'])

    end

  end

  results = case operator
            when '1'
              num_1.to_i + num_2.to_i
            when '2'
              num_1.to_i - num_2.to_i
            when '3'
              num_1.to_i * num_2.to_i
            when '4'
              num_1.to_f / num_2.to_f
  end    

  prompt("Your result is #{results}")

  prompt("Do you wish to end the program? (choose Y to end)")
  break if Kernel.gets().chomp() == 'y'
end

puts "Thank you for playing"
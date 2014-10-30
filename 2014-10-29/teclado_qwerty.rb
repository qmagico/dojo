require 'test/unit'

def teclado(frase)
    teclas = {"A"=> "2", "B"=> "22", "C" => "222", "D"=> "3", "E"=> "33",
        "F"=> "333", "G"=> "4", "H"=> "44", "I" => "444", "J"=> "5", "K"=> "55", "L"=> "555",
        "M"=> "6", "N"=> "66", "O"=> "666", "P"=> "7", "Q"=> "77", "R"=> "777", "S"=> "7777",
        "T"=> "8", "U"=> "88", "V"=> "888", "W"=> "9", "X"=> "99", "Y"=> "999", "Z"=> "9999",
        " "=> "0"}

    result = ""

    if frase.upcase == frase and not ['', ' '].include?(frase) 
        result = "**"
        frase.split("").each_with_index { |letra, index|
            caracteres_na_mesma_tecla = result[-1] == teclas[frase[index].upcase][0]
            if (index != 0 && caracteres_na_mesma_tecla)
                result += "_"
            end
            result += teclas[letra]
        }
    else
        frase.split("").each_with_index { |letra, index|
            caracteres_na_mesma_tecla = result[-1] == teclas[frase[index].upcase][0]
            if (index != 0 && caracteres_na_mesma_tecla)
                result += "_"
            end

            if (teclas[letra] && letra != " ")
                result += "*" + teclas[letra]
            else
                tecla_upper = letra.upcase
                result += teclas[tecla_upper]
            end
        }
    end

    result
end

class MyTest < Test::Unit::TestCase
        # se for maiúsculo, coloca * na frente do número correspondente
        # se for tudo maiúsculo, coloca ** na frente da frase

    def test_uma_tecla
        # maiusculo
        assert_equal(teclado("A"), "**2")
        assert_equal(teclado("B"), "**22")
        assert_equal(teclado("C"), "**222")
        assert_equal(teclado(" "), "0")

        # minusculo
        assert_equal(teclado("a"), "2")
        assert_equal(teclado(""), "")
    end

    def test_duas_teclas
        assert_equal(teclado("AD"),"**23")
        assert_equal(teclado("AA"),"**2_2")
        assert_equal(teclado("AB"),"**2_22")
        assert_equal(teclado("AC"),"**2_222")
    end

    def test_frase_inteira_camel_case
        assert_equal(teclado("Oi"), "*666444")
        assert_equal(teclado("Oi AmIgO"), "*6664440*26*444_4*666")
    end

    def test_frase_inteira_upper_case
        assert_equal(teclado("OI"), "**666444")
        assert_equal(teclado("OI AMIGO"), "**666444026444_4666")
    end

end

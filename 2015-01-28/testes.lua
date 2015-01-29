
function ordenar(array)
	if #array == 0 then
		return {}
	end

	local intervalo
	local inicio
	local fim
	local resultado = {}
	for i, v in ipairs(array) do
		-- print("elemento " .. v .. " no index " .. i)
		if inicio == nil then
			inicio = v
			fim = inicio
		else
			fim = fim + 1
			if v ~= fim then
				if (fim == inicio + 1) then
					intervalo = {inicio}
				else
					intervalo = {inicio, fim - 1}
				end
				-- print("inicio" .. inicio .. " fim" .. fim - 1)
				resultado[#resultado + 1] = intervalo
				--print(table.concat(intervalo))
				inicio = v
				fim = inicio
			end
		end
	end

	if inicio == fim or fim == nil then
		intervalo = {inicio}
	else
		intervalo = {inicio, fim}
	end
	-- print(intervalo[1], intervalo[2])
	--print(table.concat(intervalo, ' '))
	resultado[#resultado + 1] = intervalo
	return resultado
end

function compare(table1, table2)
	if (#table1 ~= #table2) then
		return false
	end

	for i, t1 in ipairs(table1) do
		if (type(t1) == "table") then
			return compare(t1, table2[i])
		end

		if (table1[i] ~= table2[i]) then
			return false
		end
	end
	return true
end

teste_cases = {
	teste_um_igual_a_um = function()
		assert(1 == 1)
	end,
	teste_lista_sem_elemento = function()
		assert(0 == #ordenar({}) )
	end,
	teste_um_elemento = function ( )
		assert(compare({{1}}, ordenar({1})))
	end,
	teste_dois_elementos = function ( )
		assert(compare({{1,2}}, ordenar {1,2}))
	end,
	teste_compare = function ( )
		assert(compare({{1,2}},{{1,2}}))
	end,
	teste_compare_false_not = function ( )
		assert(not compare({{1,2}},{{1,3}}))
	end,
	teste_varios_elementos = function ()
		assert(compare({{1, 2}, {4}}, ordenar {1, 2, 4}))
	end,
	teste_intervalo_maior = function ()
		assert(compare({{1, 3}}, ordenar{1, 2, 3}))
	end,
	teste_trosoba = function ()
		assert(compare({{1, 3},{5, 8},{10, 12},{14}}, ordenar{1, 2, 3, 5, 6, 7, 8, 10, 11, 12, 14}))
	end,
	teste_bustamante = function ()
		assert(compare({{1},{3}, {5}, {7}}, ordenar{1, 3, 5, 7}))
	end,
	teste_exercicio = function ()
		assert(compare({ {100,105}, {110,111}, {113,115}, {150} }, ordenar{100, 101, 102, 103, 104, 105, 110, 111, 113, 114, 115, 150}))
	end,
}

function run_teste ()
	local contador_de_erro= 0
	for k, v in pairs(teste_cases) do
		local resultado, erro = pcall(v)
		if resultado then
			print(k .. " passou")
		else
			contador_de_erro = contador_de_erro + 1
			print(k .. " deu pau")
			print(erro)
		end
	end
	print("\n" .. contador_de_erro .. " falharam")
end

run_teste()
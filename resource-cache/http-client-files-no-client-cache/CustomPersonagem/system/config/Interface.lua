interface = {
	messagesConfig = {
		typeMessage = 'Chat',
		notifyServer = function(source, message, type)
			exports["FR_DxMessages"]:callInfo(source, type, message)
		end, 
		notifyClient = function(message, type)
			exports["FR_DxMessages"]:callInfo(type, message)
		end,
	},

	creationpanel = {
		rgbselected = {95, 21, 191, 255},
		rgbprincipal = {129, 89, 247, 200},
		rgbsecundario = {255, 255, 255},
		rgbbackground = {23, 23, 23, 170},
		rgbrectangle = {0, 0, 0, 170},

		cameraposition = {  x = 377.73001098633, y = -2028.4830322266, z = 8.4961004257202, rx = 378.7297668457, ry = -2028.4970703125, rz = 8.4789133071899 },
		camerazoomposition = {x = 382.1462097168, y = -2028.4344482422, z = 8.5340995788574, rx = 383.125, ry = -2028.6278076172, rz = 8.4664249420166 },
		pedposition = { x = 384.331, y = -2028.710, z = 7.836 },
		pedrotation = { x = -0, y = 0 , z = 91.917610168457 },
		confirmposition = { x = 823.00513, y =  -1352.86414, z = 13.53490, dim = 0, int = 0}, -- Posição que o jogador será setado após criar o personagem

		messages = { -- Você pode usar códigos HEX 
			accountcreated = {'#FFFFFFSeu personagem foi criado com sucesso!', 'success'},
			genderselected = {'#FFFFFFVocê escolheu seu gênero com sucesso! Agora customize seu personagem.', 'success'}
		},

		circles = {
			skintone = {
				['1'] = { 253, 208, 183 },
				['2'] = { 237, 180, 156 },
				['3'] = { 142, 90, 71 },
				['4'] = { 105, 69, 56 },
				['5'] = { 75, 54, 46 },
				['6'] = { 56, 43, 38 }
			},
		},

		customizeoptions = {
			['male'] = {
				[1] = {
					title = 'Cor dos olhos',
					options = {
						{'Verde-escuro', 'facehead', 'eyes', 1, true},
						{'Azul-escuro ', 'facehead', 'eyes', 2, true},
						{'Castanho', 'facehead', 'eyes', 3, true},
						{'Verde-claro', 'facehead', 'eyes', 4, true},
						{'Lilás', 'facehead', 'eyes', 5, true},
						{'Cinza', 'facehead', 'eyes', 6, true},
						{'Branco', 'facehead', 'eyes', 7, true},
					},
				},
				[2] = {
					title = 'Pelos faciais',
					options = {
						{'Nenhum', 'head', 0, 0, true},
						{'Trançado grande', 'head', 'Cabelo1', 1, true},
						{'Moicano médio', 'head', 'Cabelo2', 1, true},
						{'Liso médio', 'head', 'Cabelo4', 1, true},
					},
				},
				[3] = {
					title = false,
					options = {
						{'Nenhum', 'facehead', 'beard', 0, true},
						{'Barba 01', 'facehead', 'beard', 1, true},
						{'Barba 02', 'facehead', 'beard', 2, true},
						{'Barba 03', 'facehead', 'beard', 3, true},
						{'Barba 04', 'facehead', 'beard', 4, true},
						{'Barba 05', 'facehead', 'beard', 5, true},
						{'Barba 06', 'facehead', 'beard', 6, true},
						{'Barba 07', 'facehead', 'beard', 7, true},
						{'Barba 08', 'facehead', 'beard', 8, true},
						{'Barba 09', 'facehead', 'beard', 9, true},
						{'Barba 10', 'facehead', 'beard', 10, true},
						{'Barba 11', 'facehead', 'beard', 11, true},
						{'Barba 12', 'facehead', 'beard', 12, true},
						{'Barba 13', 'facehead', 'beard', 13, true},
						{'Barba 14', 'facehead', 'beard', 14, true},
					},
				},
				[4] = {
					title = false,
					options = {
						{'Nenhum', 'facehead', 'eyebrow', 0, true},
						{'Sombrancelha 01', 'facehead', 'eyebrow', 1, true},
						{'Sombrancelha 02', 'facehead', 'eyebrow', 2, true},
						{'Sombrancelha 03', 'facehead', 'eyebrow', 3, true},
						{'Sombrancelha 04', 'facehead', 'eyebrow', 4, true},
						{'Sombrancelha 05', 'facehead', 'eyebrow', 5, true},
						{'Sombrancelha 06', 'facehead', 'eyebrow', 6, true},
						{'Sombrancelha 07', 'facehead', 'eyebrow', 7, true},
						{'Sombrancelha 08', 'facehead', 'eyebrow', 8, true},
						{'Sombrancelha 09', 'facehead', 'eyebrow', 9, true},
					},
				},
				[5] = {
					title = 'Roupas iniciais',
					options = {
						{'Nenhum', 'torso', 0, 0, false},
						{'Polo preta', 'torso', 'camisa.polo', 6, false},
						{'Manga-longa preta', 'torso', 'camisa.media', 1, false},
						{'Regata listrada', 'torso', 'camisa.regata', 2, false},
						{'Praiana c/ estampa', 'torso', 'camisa.praia', 1, false},
						{'Moletom Diamond LS', 'torso', 'casaco.moletom', 6, false},
					},
				},
				[6] = {
					title = false,
					options = {
						{'Nenhum', 'legs', 'body.cueca', 1, false},
						{'Bermuda xadrez', 'legs', 'bermuda.padrao', 1, false},
						{'Bermuda cargo', 'legs', 'bermuda.camo', 3, false},
						{'Calça jeans', 'legs', 'calca.jeans', 6, false},
						{'Calça esportiva', 'legs', 'calca.larga', 2, false},
					},
				},
				[7] = {
					title = false,
					options = {
						{'Nenhum', 'feet', 0, 0, false},
						{'Chinelo preto', 'feet', 'pe.chinelo', 1, false},
						{'Sandália cinza', 'feet', 'pe.sandalia', 6, false},
						{'Old School preto', 'feet', 'pe.tenis2', 4, false},
						{'Harg branco', 'feet', 'pe.tenis1', 1, false},
						{'Sapato social', 'feet', 'pe.sapatosocial', 1, false},
					},
				},
			},
			['female'] = {
				[1] = {
					title = 'Cor dos olhos',
					options = {
						{'Padrão', 'facehead', 0, 0, true},
						{'Verde-Marinho', 'facehead', 'eyes', 1, true},
						{'Azul-Marinho', 'facehead', 'eyes', 2, true},
						{'Verde-claro', 'facehead', 'eyes', 3, true},
						{'Castanho', 'facehead', 'eyes', 4, true},
						{'Lilás', 'facehead', 'eyes', 5, true},
						{'Cinza', 'facehead', 'eyes', 6, true},
						{'Branco', 'facehead', 'eyes', 7, true},
					},
				},
				[2] = {
					title = 'Pelos faciais',
					options = {
						{'Nenhum', 'head', 0, 0, true},
						{'Cabelo 01', 'head', 'hair.1', 1, true},
						{'Cabelo 02', 'head', 'hair.3', 1, true},
						{'Cabelo 03', 'head', 'hair.4', 1, true},
					},
				},
				[3] = {
					title = false,
					options = {
						{'Nenhum', 'facehead', 'eyebrow', 0, true},
						{'Sombrancelha 01', 'facehead', 'eyebrow', 1, true},
						{'Sombrancelha 02', 'facehead', 'eyebrow', 2, true},
						{'Sombrancelha 03', 'facehead', 'eyebrow', 3, true},
						{'Sombrancelha 04', 'facehead', 'eyebrow', 4, true},
						{'Sombrancelha 05', 'facehead', 'eyebrow', 5, true},
						{'Sombrancelha 06', 'facehead', 'eyebrow', 6, true},
					},
				},
				[4] = {
					title = 'Maquiagem',
					options = {
						{'Nenhum', 'facehead', 'lipstick', 0, true},
						{'Batom Preto', 'facehead', 'lipstick', 1, true},
						{'Batom Lilás', 'facehead', 'lipstick', 2, true},
						{'Batom Castanho', 'facehead', 'lipstick', 3, true},
						{'Batom Vermelho', 'facehead', 'lipstick', 4, true},
						{'Batom Vermelho-Choque', 'facehead', 'lipstick', 5, true},
						{'Batom Laranja', 'facehead', 'lipstick', 6, true},
						{'Batom Nude', 'facehead', 'lipstick', 8, true},
						{'Batom Vinho', 'facehead', 'lipstick', 9, true},
						{'Batom Roxo', 'facehead', 'lipstick', 10, true},
					},
				},
				[5] = {
					title = false,
					options = {
						{'Nenhum', 'facehead', 'blush', 0, true},
						{'Blush 01', 'facehead', 'blush', 1, true},
						{'Blush 02', 'facehead', 'blush', 2, true},
						{'Blush 03', 'facehead', 'blush', 3, true},
						{'Sardas 01', 'facehead', 'blush', 4, true},
					},
				},
				[6] = {
					title = 'Roupas iniciais',
					options = {
						{'Nenhum', 'torso', 0, 0, false},
						{'Camiseta Branca LOVE', 'torso', 'camisa.padrao', 11, false},
						{'Camiseta Preta Trasher', 'torso', 'camisa.padrao', 8, false},
						{'Topless Squash', 'torso', 'camisa.pequena', 9, false},
						{'Topless Guffy Cinza', 'torso', 'camisa.pequena', 1, false},
						{'Regata Roxa Ghost', 'torso', 'camisa.regata', 6, false},
						{'Regata Preta', 'torso', 'camisa.regata', 1, false},
					},
				},
				[7] = {
					title = false,
					options = {
						{'Nenhum', 'legs', 0, 0, false},
						{'Saia Preta', 'legs', 'saia.padrao', 1, false},
						{'Saia Branca', 'legs', 'saia.padrao', 2, false},
						{'Calça Camo Branca', 'legs', 'calca.padrao', 3, false},
						{'Calça Camo Padrão', 'legs', 'calca.padrao', 1, false},
						{'Calça Jeans', 'legs', 'calca.padrao', 4, false},
					},
				},
				[8] = {
					title = false,
					options = {
						{'Nenhum', 'feet', 0, 0, false},
						{'Yeazzy Boost', 'feet', 'Yeazzy', 1, false},
						{'Sandália', 'feet', 'pe.sandalia', 1, false},
						{'Bota Marrom', 'feet', 'pe.bota', 1, false},
						{'Bota Preta', 'feet', 'pe.bota', 2, false},
					},
				},
				[9] = {
					title = false,
					options = {
						{'Nenhum', 'extra2', 0, 0, true},
						{'Óculos Branco/Preto ', 'extra2', 'oculos.padrao', 1, true},
						{'Óculos Preto/Dourado', 'extra2', 'oculos.padrao', 2, true},
						{'Óculos Preto/Rosa', 'extra2', 'oculos.padrao', 3, true},
						{'Juliete Lente Rosa', 'extra2', 'oculos.juliet', 1, true},
						{'Juliete Lente Amarela', 'extra2', 'oculos.juliet', 8, true},
						{'Juliete Lente Cinza', 'extra2', 'oculos.juliet', 6, true},
					},
				},
			},
		},
	},


	storepanel = {
		
		rgbselected = {95, 21, 191, 255},
		rgbprincipal = {129, 89, 247, 200},
		rgbsecundario = {255, 255, 255},
		rgbbackground = {23, 23, 23, 170},
		rgbbackground2 = {48, 48, 48, 170},
		rgbheader = {15, 14, 14, 170},

		cameraposition = {  x = 377.73001098633, y = -2028.4830322266, z = 8.4961004257202, rx = 378.7297668457, ry = -2028.4970703125, rz = 8.4789133071899 }, --[[ Posição da câmera ]]
		pedposition = { x = 384.331, y = -2028.710, z = 7.836 }, --[[ Posição no mapa do jogador ]]
		pedrotation = { x = -0, y = 0 , z = 91.917610168457 }, --[[ Posição no mapa do jogador ]]

		messages = { -- Você pode usar códigos HEX 
			-- Não mexa = {'Mensagem', 'Tipo do aviso da infobox, caso esteja usando!'}
			cartempy = {'#FFFFFFColoque algo no carrinho para comprar', 'warning'}, -- Mensagem quando o jogador apertar enter e não tiver nenhuma roupa no carrinho
			buySuccessful = {'#FFFFFFVocê comprou sua roupa com sucesso', 'success'}, -- Mensagem quando a compra das roupas for bem sucedida
			notMoney = {'#FFFFFFVocê não possui dinheiro suficiente para isso', 'error'}, -- Mensagem quando o jogador não possui dinheiro suficiente para comprar as roupas
			notcompatible = {'#FFFFFFVocê não pode colocar essa roupa sem estar usando um Blazer', 'error'}, -- Mensagem quando o jogador tentar colocar a parte do meio do terno sem estar usando um blazer
		},

		storeoptions = {
			
			enterMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {2779, 2453, 11, 0, 0, {129, 89, 247, 200}},
				[2] = {2244.39746, -1664.97461, 15.47656, 0, 0, {129, 89, 247, 200}},
				[3] = {-1882.53687, 866.28107, 35.17188, 0, 0, {129, 89, 247, 200}},
			},
			
			enterPosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {203.76163, -48.29527, 1000.91370, 1, 2}, 
				[2] = {207.62039, -109.19683, 1005.13281, 15, 2},
				[3] = {160.85002, -94.31634, 1001.80469 + 1, 18, 2},
			},

			leaveMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {203.96118, -50.14730, 1001.80469, 1, 2, {129, 89, 247, 200}},
				[2] = {207.77580, -111.13270, 1005.13281, 15, 2, {129, 89, 247, 200}},
				[3] = {161.30772, -97.10416, 1001.80469, 18, 2, {129, 89, 247, 200}},
			},

			leavePosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {2779, 2451, 11, 0, 0}, 
				[2] = {2245, -1662, 15, 0, 0},
				[3] = {-1884, 863, 35, 0, 0},
			},

			openMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {203.17682, -43.27431, 1001.80469, 1, 2, {129, 89, 247, 200}},
				[2] = {206.49759, -100.46308, 1005.25781, 15, 2, {129, 89, 247, 200}},
				[3] = {159.78752, -83.25415, 1001.80469, 18, 2, {129, 89, 247, 200}}
			},

			openLeavePosition = {
				[1] = {212, -42, 1003,-0, 0, 89.086288452148, 1, 2},
				[2] = {217.15936, -100.50900, 1005.25781, -0,0,90.509590148926, 15, 2},
				[3] = {179.12054, -88.21897, 1002.02344, -0, 0, 85.929969787598, 18, 2}
			},

			pedPosition = { -- X, Y, Z, RX, RY, RZ, Interior, Dimensão
				[1] = {212, -42, 1003,-0, 0, 89.086288452148, 1, 2},
				[2] = {217.15936, -100.50900, 1005.25781, -0,0,90.509590148926, 15, 2},
				[3] = {179.12054, -88.21897, 1002.02344, -0, 0, 85.929969787598, 18, 2}
			},

			pedCamera = { -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[1] = {207.60639953613,-41.873199462891,1002.3941040039,208.60575866699,-41.838081359863,1002.4016723633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[2] = {213.09970092773,-100.48930358887,1005.8607177734,214.09925842285,-100.45945739746,1005.8585205078}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[3] = {175.20329284668,-88.357696533203,1002.3449707031,176.20217895508,-88.335266113281,1002.3863525391}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
			},

		
			blip = true, -- Caso esteja ativado, os blips serão criados na mesma posição dos markers de entrada da loja
			blipid = 45, -- ID do Blip
			blipdistance = 100,
		},

		-- Argumentos da tabela pages:
		-- (Index da Roupa) = {'pngfile', preço, {desctbody}}
		pages = {
			['male'] = {
				['Camisetas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Camiseta Will Smith (Preta)', 60, 'camisa.padrao', 1, 'torso', false},
					[3] = {'Camiseta AC/DC (Preta)', 60, 'camisa.padrao', 2, 'torso', false},
					[4] = {'Camiseta Adidas Graffiti (Preta) ', 70, 'camisa.padrao', 3, 'torso', false},
					[5] = {'Camiseta VAMTAC Eyes (Preta) ', 60, 'camisa.padrao', 4, 'torso', false},
					[6] = {'Camiseta Trasher (Preta) ', 60, 'camisa.padrao', 5, 'torso', false},
					[7] = {'Camiseta Pink Floyd (Preta) ', 60, 'camisa.padrao', 9, 'torso', false},
					[8] = {'Camiseta Trasher Espadas (Branca) ', 50, 'camisa.padrao', 6, 'torso', false},
					[9] = {'Camiseta Dragon Ball Z (Branca) ', 50, 'camisa.padrao', 7, 'torso', false},
					[10] = {'Camiseta Nike Jordan (Rosa) ', 70, 'camisa.padrao', 8, 'torso', false},
					[11] = {'Camiseta Squash Codes (Multicolor) ', 50, 'camisa.padrao', 10, 'torso', false},
					[12] = {'Camiseta Gato Renascentista (Preta)', 50, 'camisa.padrao', 11, 'torso', false},
					[13] = {'Camiseta Flamengo BS2 (Branca) ', 90, 'camisa.padrao', 12, 'torso', false},
					[14] = {'Camiseta Real Madrid (Branca)', 90, 'camisa.padrao', 13, 'torso', false},
					[15] = {'Camiseta Listrada', 60, 'camisa.padrao', 14, 'torso', false},
					[16] = {'Camiseta Flamengo (Cinza)', 70, 'camisa.padrao', 15, 'torso', false},
					[17] = {'Camiseta Nike (Vermelha)', 80, 'camisa.padrao', 16, 'torso', false},
					[18] = {'Camiseta Nike (Cinza)', 70, 'camisa.padrao', 17, 'torso', false},
					[19] = {'Camiseta PSG (Preta)', 80, 'camisa.padrao', 18, 'torso', false},
					[20] = {'Camiseta Time (Vermelha)', 70, 'camisa.padrao', 19, 'torso', false},
					[21] = {'Camiseta Nike (Brancaa)', 70, 'camisa.padrao', 20, 'torso', false},
					[22] = {'Camiseta Time (Azul)', 80, 'camisa.padrao', 21, 'torso', false},
					[23] = {'Camiseta Branca', 75, 'camisa.padrao', 22, 'torso', false},
					[24] = {'Camiseta Time (Quadriculada)', 70, 'camisa.padrao', 23, 'torso', false},
					[25] = {'Camiseta Branca As', 65, 'camisa.padrao', 24, 'torso', false},
					[26] = {'Camiseta Oakley', 65, 'camisa.padrao', 25, 'torso', false},
					[27] = {'Camiseta Time (Vermelhaa)', 60, 'camisa.padrao', 26, 'torso', false},
					[28] = {'Camiseta Time (Branca)', 70, 'camisa.padrao', 27, 'torso', false},
					[29] = {'Camiseta BVB (Amarela)', 70, 'camisa.padrao', 28, 'torso', false},
					[30] = {'Camiseta Timee (Azul)', 60, 'camisa.padrao', 29, 'torso', false},
					[31] = {'Camiseta Time (Preta)', 70, 'camisa.padrao', 30, 'torso', false},
					[32] = {'Camiseta Turquia', 60, 'camisa.padrao', 31, 'torso', false},
					[33] = {'Camiseta SP (Preta)', 60, 'camisa.padrao', 32, 'torso', false},
					[34] = {'Camiseta Animais', 60, 'camisa.padrao', 33, 'torso', false},
					[35] = {'Camiseta Flamengo (Vermelhaa)', 60, 'camisa.padrao', 34, 'torso', false},
					[36] = {'Camiseta Supreme', 50, 'camisa.padrao', 35, 'torso', false},
					[37] = {'Camiseta Time (Azuul)', 60, 'camisa.padrao', 36, 'torso', false},
					[38] = {'Camiseta Time (Verde)', 70, 'camisa.padrao', 37, 'torso', false},
					[39] = {'Camiseta Caveira', 50, 'camisa.padrao', 38, 'torso', false},
					[40] = {'Camiseta Nike P', 50, 'camisa.padrao', 39, 'torso', false},
					[41] = {'Camiseta Nike B', 50, 'camisa.padrao', 40, 'torso', false},
					[42] = {'Camiseta Nike PP', 50, 'camisa.padrao', 41, 'torso', false},
					[43] = {'Camiseta Nike PB', 50, 'camisa.padrao', 42, 'torso', false},
					[44] = {'Camiseta Nike L', 50, 'camisa.padrao', 43, 'torso', false},
					[45] = {'Camiseta Nike LB', 50, 'camisa.padrao', 44, 'torso', false},
					[46] = {'Camiseta Nike V', 50, 'camisa.padrao', 45, 'torso', false},
					[47] = {'Camiseta Lacoste P', 60, 'camisa.padrao', 46, 'torso', false},
					[48] = {'Camiseta Lacoste B', 60, 'camisa.padrao', 47, 'torso', false},
					[49] = {'Camiseta Lacoste C', 60, 'camisa.padrao', 48, 'torso', false},
					[50] = {'Camiseta Lacoste PB', 60, 'camisa.padrao', 49, 'torso', false},
					[51] = {'Camiseta Preta', 40, 'camisa.padrao', 50, 'torso', false},
					[52] = {'Camiseta Trident', 60, 'camisa.padrao', 51, 'torso', false},
					[53] = {'Camiseta Tider', 50, 'camisa.padrao', 52, 'torso', false},
					[54] = {'Camiseta Mono Bloco', 50, 'camisa.padrao', 53, 'torso', false},
					[55] = {'Camiseta Carnaval', 50, 'camisa.padrao', 54, 'torso', false},
					[56] = {'Camiseta Flamengo PP', 70, 'camisa.padrao', 55, 'torso', false},
					[57] = {'Camiseta Flamengo BB', 70, 'camisa.padrao', 56, 'torso', false},
					[58] = {'Camiseta Simples 1', 40, 'camisa.padrao', 57, 'torso', false},
					[59] = {'Camiseta Simples 2', 40, 'camisa.padrao', 58, 'torso', false},
					[60] = {'Camiseta Semples 3', 40, 'camisa.padrao', 59, 'torso', false},
					[61] = {'Camiseta Simples 4', 40, 'camisa.padrao', 60, 'torso', false},
				},
				['Camisetas manga-longa'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Manga-longa Preta', 80, 'camisa.media', 1, 'torso', false},
					[3] = {'Manga-longa Branco/Cinza ', 80, 'camisa.media', 2, 'torso', false},
					[4] = {'Manga-longa Azul/Branco ', 80, 'camisa.media', 3, 'torso', false},
					[5] = {'Manga-longa Rosa/Branco', 80, 'camisa.media', 4, 'torso', false},
					[6] = {'Manga-longa Laranja/Branco', 80, 'camisa.media', 5, 'torso', false},
					[7] = {'Manga-longa Vermelha/Branco', 80, 'camisa.media', 6, 'torso', false},
					[8] = {'Manga-longa Ciano/Branco', 80, 'camisa.media', 7, 'torso', false},
					[9] = {'Manga-longa Amarelo/Branco', 80, 'camisa.media', 8, 'torso', false},
				},
				['Buket'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Buket', 0, '0', '0', 'head', false},
					[2] = {'Buket Monster', 100, 'bucket.hat', 1, 'head', false},
					[3] = {'Buket Tommy', 110, 'bucket.hat', 2, 'head', false},
					[4] = {'Buket Jordan', 110, 'bucket.hat', 3, 'head', false},
					[5] = {'Buket Tommy v', 110, 'bucket.hat', 4, 'head', false},
					[6] = {'Buket Adidas Roxo', 100, 'bucket.hat', 5, 'head', false},
					[7] = {'Buket Adidas Verde', 100, 'bucket.hat', 6, 'head', false},
					[8] = {'Buket Adidas Laranja', 100, 'bucket.hat', 7, 'head', false},
					[9] = {'Buket Adidas Camuflado ', 100, 'bucket.hat', 8, 'head', false},
					[10] = {'Buket Adidas Vermelho', 100, 'bucket.hat', 9, 'head', false},
					[11] = {'Buket Adidas Azul', 100, 'bucket.hat', 10, 'head', false},
				},
				['Boné'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
				[1] = {'Tirar Bone', 0, '0', '0', 'head', false},
				[2] = {'Bone 1', 80, 'bone.padrao', 1, 'head', false},
				[3] = {'Bone 2', 80, 'bone.padrao', 2, 'head', false},
				[4] = {'Bone 3', 80, 'bone.padrao', 3, 'head', false},
				[5] = {'Bone 4', 80, 'bone.padrao', 4, 'head', false},
				[6] = {'Bone 5', 80, 'bone.padrao', 5, 'head', false},
				[7] = {'Bone 6', 80, 'bone.padrao', 6, 'head', false},
				[8] = {'Bone 7', 80, 'bone.padrao', 7, 'head', false},
				[9] = {'Bone 8', 80, 'bone.padrao', 8, 'head', false},
				[10] = {'Bone 9', 80, 'bone.padrao', 9, 'head', false},
				[11] = {'Bone 10', 80, 'bone.padrao', 10, 'head', false},
				[12] = {'Bone 11', 80, 'bone.padrao', 11, 'head', false},
				[13] = {'Bone 12', 80, 'bone.padrao', 12, 'head', false},
				},
				['Mascara Covid'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
				[1] = {'Tirar Mascara', 0, '0', '0', 'extra2', false},
				[2] = {'Mascara Preta', 20, 'corona.mask', 1, 'extra2', false},
				[3] = {'Mascara TDT', 20, 'corona.mask', 2, 'extra2', false},
				[4] = {'Mascara Vermelho', 20, 'corona.mask', 3, 'extra2', false},
				[5] = {'Mascara Azul', 20, 'corona.mask', 4, 'extra2', false},
				[6] = {'Mascara Verde', 20, 'corona.mask', 5, 'extra2', false},
				[7] = {'Mascara Laranja', 20, 'corona.mask', 6, 'extra2', false},
				[8] = {'Mascara Rosa', 20, 'corona.mask', 7, 'extra2', false},
				[9] = {'Mascara Roxo', 20, 'corona.mask', 8, 'extra2', false},
				[10] = {'Mascara Vermelho L', 20, 'corona.mask', 9, 'extra2', false},
				[11] = {'Mascara Preto L', 20, 'corona.mask', 10, 'extra2', false},
				[12] = {'Mascara Preto B', 20, 'corona.mask', 11, 'extra2', false},
				},
				['Mochilas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
				[1] = {'Tirar Mochila', 0, '0', '0', 'extra3', false},
				[2] = {'Mochila 1', 150, 'fivem.parachute', 1, 'extra3', false},
				[3] = {'Mochila 2', 150, 'fivem.parachute', 2, 'extra3', false},
				[4] = {'Mochila 3', 150, 'fivem.parachute', 3, 'extra3', false},
				[5] = {'Mochila 4', 150, 'fivem.parachute', 4, 'extra3', false},
				[6] = {'Mochila 5', 150, 'fivem.parachute', 5, 'extra3', false},
				[7] = {'Mochila 6', 150, 'fivem.parachute', 6, 'extra3', false},
				[8] = {'Mochila 7', 150, 'fivem.parachute', 7, 'extra3', false},
				[9] = {'Mochila 8', 150, 'fivem.parachute', 8, 'extra3', false},
				[10] = {'Mochila 9', 150, 'fivem.parachute', 9, 'extra3', false},
				[11] = {'Mochila 10', 150, 'fivem.parachute', 10, 'extra3', false},
				[12] = {'Mochila 11', 150, 'fivem.parachute', 11, 'extra3', false},
				[13] = {'Mochila 12', 150, 'fivem.parachute', 12, 'extra3', false},
				[14] = {'Mochila 13', 150, 'fivem.parachute', 13, 'extra3', false},
				[15] = {'Mochila 14', 140, 'fivem.parachute', 14, 'extra3', false},
				[16] = {'Mochila 15', 150, 'fivem.parachute', 15, 'extra3', false},
				[17] = {'Mochila 16', 150, 'fivem.parachute', 16, 'extra3', false},
				[18] = {'Mochila 17', 150, 'fivem.parachute', 17, 'extra3', false},
				[19] = {'Mochila 18', 150, 'fivem.parachute', 18, 'extra3', false},
				[20] = {'Mochila 19', 150, 'fivem.parachute', 19, 'extra3', false},
				[21] = {'Mochila Jamaica', 150, 'fivem.parachute', 20, 'extra3', false},
				[22] = {'Mochila Turquia', 150, 'fivem.parachute', 21, 'extra3', false},
				[23] = {'Mochila Brasil', 150, 'fivem.parachute', 22, 'extra3', false},
				[24] = {'Mochila Rússia', 150, 'fivem.parachute', 23, 'extra3', false},
				[25] = {'Mochila Argentina', 150, 'fivem.parachute', 24, 'extra3', false},
				[26] = {'Mochila EUA', 150, 'fivem.parachute', 25, 'extra3', false},
				},
				['Bandanas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
				[1] = {'Tirar Bandana', 0, '0', '0', 'extra2', false},
				[2] = {'Bandana 1', 110, 'skull.mask', 1, 'extra2', false},
				[3] = {'Bandana 2', 110, 'skull.mask', 2, 'extra2', false},
				[4] = {'Bandana 3', 110, 'skull.mask', 3, 'extra2', false},
				[5] = {'Bandana 4', 110, 'skull.mask', 4, 'extra2', false},
				[6] = {'Bandana 5', 110, 'skull.mask', 5, 'extra2', false},
				[7] = {'Bandana 6', 110, 'skull.mask', 6, 'extra2', false},
				[8] = {'Bandana 7', 110, 'skull.mask', 7, 'extra2', false},
				[9] = {'Bandana 8', 110, 'skull.mask', 8, 'extra2', false},
				},
				['Moletons'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Moletom Lacoste (Azul)', 90, 'casaco.moletom', 1, 'torso', false},
					[3] = {'Moletom Bigness (Vermelho)', 90, 'casaco.moletom', 2, 'torso', false},
					[4] = {'Moletom Bigness (Cinza)', 90, 'casaco.moletom', 4, 'torso', false},
					[5] = {'Moletom Flying Bravo (Branco)', 90, 'casaco.moletom', 3, 'torso', false},
					[6] = {'Moletom Lacoste (Cinza)', 90, 'casaco.moletom', 5, 'torso', false},
					[7] = {'Moletom Diamond LS (Branco)', 90, 'casaco.moletom', 6, 'torso', false},
					[8] = {'Moletom Supreme NY (Preto)', 90, 'casaco.moletom', 7, 'torso', false},
					[9] = {'Moletom Cinza', 90, 'casaco.moletom', 8, 'torso', false},
					[10] = {'Moletom Preto', 90, 'casaco.moletom', 9, 'torso', false},
					[11] = {'Moletom Preto N', 90, 'casaco.moletom', 10, 'torso', false},
					[12] = {'Moletom Marron', 90, 'casaco.moletom', 11, 'torso', false},
					[13] = {'Moletom Vermelhado', 90, 'casaco.moletom', 12, 'torso', false},
				},
				['Camiseta Praiano'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Gola praiano (Florida 01)', 55, 'camisa.praia', 1, 'torso', false},
					[3] = {'Gola praiano (Florida 02)', 55, 'camisa.praia', 2, 'torso', false},
					[4] = {'Gola praiano (Florida 03)', 55, 'camisa.praia', 3, 'torso', false},
					[5] = {'Gola praiano (Florida Cinza)', 55, 'camisa.praia', 4, 'torso', false},
					
				},
				['Regatas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Regata Listrada (Azul/Branco/Preto) ', 40 , 'camisa.regata', 2, 'torso', false},
					[3] = {'Regata Nike (Preta)', 40, 'camisa.regata', 3, 'torso', false},
					[4] = {'Regata Adidas (Preta)', 40, 'camisa.regata', 7, 'torso', false},
					[5] = {'Regata Salmão', 40, 'camisa.regata', 1, 'torso', false},
					[6] = {'Regata Roxa', 40, 'camisa.regata', 4, 'torso', false},
					[7] = {'Regata Azul-bebê', 40, 'camisa.regata', 5, 'torso', false},
					[8] = {'Regata Laranja', 40, 'camisa.regata', 6, 'torso', false},
				},
				['Calça Jeans'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Jeans Preta ', 110, 'calca.jeans', 1, 'legs', false},
					[3] = {'Jeans Preta P', 100, 'calca.jeans', 2, 'legs', false},
					[4] = {'Jeans Azul (Flosh)', 100, 'calca.jeans', 3, 'legs', false},
					[5] = {'Jeans Cinza (Flosh)', 110, 'calca.jeans', 4, 'legs', false},
					[6] = {'Jeans Padrão', 100, 'calca.jeans', 5, 'legs', false},
				},
				['Bermuda Cargo'] = {
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Cargo Preta Camuflada ', 70, 'bermuda.camo', 1, 'legs', false},
					[3] = {'Cargo Roxa', 70, 'bermuda.camo', 2, 'legs', false},
					[4] = {'Cargo Bege ', 70, 'bermuda.camo', 3, 'legs', false},
				},
				['Bermuda Tactel'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Tactel Florida Roxo', 50, 'bermuda.padrao', 1, 'legs', false},
					[3] = {'Tactel Florida Azul', 50, 'bermuda.padrao', 2, 'legs', false},
					[4] = {'Tactel Florida Laranja', 50, 'bermuda.padrao', 5, 'legs', false},
					[5] = {'Tactel Azul/Rosa', 50, 'bermuda.padrao', 3, 'legs', false},
					[6] = {'Tactel Cinza/Branco', 50, 'bermuda.padrao', 6, 'legs', false},
					[7] = {'Tactel Branco', 50, 'bermuda.padrao', 7, 'legs', false},
					[8] = {'Tactel Preto', 50, 'bermuda.padrao', 8, 'legs', false},
					[9] = {'Tactel Azul ', 50, 'bermuda.padrao', 9, 'legs', false},
					[10] = {'Tactel Xadrez', 50, 'bermuda.padrao', 4, 'legs', false},
				},
				['Calça Esportiva'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Esportiva Cinza', 70, 'calca.larga', 1, 'legs', false},
					[3] = {'Esportiva Preta', 70, 'calca.larga', 2, 'legs', false},
					[4] = {'Esportiva Azul-Escuro', 70, 'calca.larga', 3, 'legs', false},
					[5] = {'Esportiva Vermelho', 70, 'calca.larga', 4, 'legs', false},
					[6] = {'Esportiva Camuflagem Branca', 70, 'calca.larga', 5, 'legs', false},
					[7] = {'Esportiva Camuflagem', 70, 'calca.larga', 6, 'legs', false},
					[8] = {'Esportiva Azul-Claro', 70, 'calca.larga', 7, 'legs', false},
					
				},
				['Camisetas POLO'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Polo Azul', 70, 'camisa.polo', 1, 'torso', false},
					[3] = {'Polo Laranja', 70, 'camisa.polo', 2, 'torso', false},
					[4] = {'Polo Roxa', 70, 'camisa.polo', 3, 'torso', false},
					[5] = {'Polo Cinza', 70, 'camisa.polo', 5, 'torso', false},
					[6] = {'Polo Cinza/Preto ', 70, 'camisa.polo', 6, 'torso', false},
					[7] = {'Polo Listrada Branco/Azul ', 70, 'camisa.polo', 7, 'torso', false},
					[8] = {'Polo Preta Lacoste', 70, 'camisa.polo', 8, 'torso', false},
				},
				['Ternos'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar meio do terno', 0, '0', '0', 'terno', false},
					[2] = {'Tirar Blazer', 0, '0', '0', 'torso', false},
					[3] = {'Tirar Social', 0, 'body.cueca', 1, 'legs', false},
					[4] = {'Meio do terno', 60, 'terno.meio', 1, 'terno', false},
					[5] = {'Blazer Preto Estampado', 100, 'terno.blusa', 1, 'torso', false},
					[6] = {'Blazer Preto Listrado ', 100, 'terno.blusa', 2, 'torso', false},
					[7] = {'Blazer Preto Puro ', 100, 'terno.blusa', 3, 'torso', false},
					[8] = {'Blazer Azul Puro ', 100, 'terno.blusa', 4, 'torso', false},
					[9] = {'Blazer Azul Listrado', 100, 'terno.blusa', 5, 'torso', false},
					[10] = {'Social Preto Estampado', 100, 'terno.calca', 1, 'legs', false},
					[11] = {'Social Cinza Puro', 100, 'terno.calca', 2, 'legs', false},
					[12] = {'Social Azul Puro', 100, 'terno.calca', 3, 'legs', false},
					[13] = {'Social Preto Puro', 100, 'terno.calca', 4, 'legs', false},
					[14] = {'Social Branco Puro', 100, 'terno.calca', 5, 'legs', false},
					[15] = {'Social Preto Listrado', 100, 'terno.calca', 6, 'legs', false},
					[16] = {'Social Azul Listrado', 100, 'terno.calca', 7, 'legs', false},
					[17] = {'Social Branco Amarrotado', 100, 'terno.calca', 8, 'legs', false},
					[18] = {'Social Cinza Amarrotado', 100, 'terno.calca', 9, 'legs', false},
				},
				['Sapatos'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Sapato Social', 80, 'pe.sapatosocial', 1, 'feet', false},
				},
				['Tenis'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Old School Cinza C', 70, 'pe.tenis2', 2, 'feet', false},
					[3] = {'Old School Preto', 70, 'pe.tenis2', 3, 'feet', false},
					[4] = {'Old School Preto P', 70, 'pe.tenis2', 4, 'feet', false},
					[5] = {'Old School Roxo', 70, 'pe.tenis2', 5, 'feet', false},
					[6] = {'Old School Verde', 70, 'pe.tenis2', 6, 'feet', false},
					[7] = {'Old School Verde C', 70, 'pe.tenis2', 7, 'feet', false},
					[8] = {'Old School Vermelho', 70, 'pe.tenis2', 8, 'feet', false},
					[9] = {'Old School Ciano', 70, 'pe.tenis2', 9, 'feet', false},
					[10] = {'Old School Azul bebê', 70, 'pe.tenis2', 10, 'feet', false},
					[11] = {'Old School Azul escuro', 70, 'pe.tenis2', 11, 'feet', false},
					[12] = {'Old School Laranja', 70, 'pe.tenis2', 12, 'feet', false},
				},
				['Sandálias'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Chinelo de Abertura Preto', 50, 'pe.chinelo', 1, 'feet', false},
					[3] = {'Sandália Azul', 60, 'pe.sandalia', 1, 'feet', false},
					[4] = {'Sandália Verde', 60, 'pe.sandalia', 2, 'feet', false},
					[5] = {'Sandália Amarela', 60, 'pe.sandalia', 3, 'feet', false},
					[6] = {'Sandália Vermelho', 60, 'pe.sandalia', 4, 'feet', false},
					[7] = {'Sandália Roxa', 60, 'pe.sandalia', 5, 'feet', false},
					[8] = {'Sandália Branca', 60, 'pe.sandalia', 6, 'feet', false},
				},
				['Chinelos'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
				[1] = {'Descalço', 0, '0', '0', 'feet', false},
				[2] = {'Chinelo Tommy Azul', 50, 'pe.chinelo', 2, 'feet', false},
				[3] = {'Chinelo Lacoste Azul', 50, 'pe.chinelo', 3, 'feet', false},
				[4] = {'Chinelo Tommy Preto', 50, 'pe.chinelo', 4, 'feet', false},
				[5] = {'Chinelo Nike Branco', 50, 'pe.chinelo', 5, 'feet', false},
				[6] = {'Chinelo Preto', 50, 'pe.chinelo', 6, 'feet', false},
				[7] = {'Chinelo Lacoste Branco', 50, 'pe.chinelo', 7, 'feet', false},
				[8] = {'Chinelo Lacoste', 50, 'pe.chinelo', 8, 'feet', false},
				},
				['Acessórios'] = {
					[1] = {'Ficar careca', 0, '0', '0', 'head', true},
					[2] = {'Sem Oculos', 0, '0', '0', 'extra1', true},
					[3] = {'Chapeu Vaqueiro Marrom', 80, 'chapeu.vaqueiro', 1, 'head', true},
					[4] = {'Chapeu Vaqueiro Rosa', 80, 'chapeu.vaqueiro', 2, 'head', true},
					[5] = {'Chapeu Vaqueiro Branco', 80, 'chapeu.vaqueiro', 3, 'head', true},
					[6] = {'Chapeu Vaqueiro Amarelo', 80, 'chapeu.vaqueiro', 4, 'head', true},
					[7] = {'Chapeu Vaqueiro Azul', 80, 'chapeu.vaqueiro', 5, 'head', true},
					[8] = {'Óculos Branco', 40, 'oculos.padrao', 1, 'extra1', true},
					[9] = {'Óculos Dourado', 40, 'oculos.padrao', 2, 'extra1', true},
					[10] = {'Óculos Rosa', 40, 'oculos.padrao', 3, 'extra1', true},
					[11] = {'Óculos Azul', 40, 'oculos.padrao', 4, 'extra1', true},
					[12] = {'Óculos Verde', 40, 'oculos.padrao', 5, 'extra1', true},
					[13] = {'Óculos Vermelho', 40, 'oculos.padrao', 6, 'extra1', true},
					[14] = {'Juliette 1', 80, 'glasse.juliette', 1, 'extra1', true},
					[15] = {'Juliette 2', 80, 'glasse.juliette', 2, 'extra1', true},
					[16] = {'Juliette 3', 80, 'glasse.juliette', 3, 'extra1', true},
				},	
			},
			['female'] = {
				['Camisetas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'torso', false},
					[2] = {'Lisa Branco', 50, 'camisa.padrao', 2, 'torso', false},
					[3] = {'Lisa Preto', 50, 'camisa.padrao', 12, 'torso', false},
					[4] = {'Estampa Chanell Rosa (Branco)', 50, 'camisa.padrao', 1, 'torso', false},
					[5] = {'Estampa PinkHeart (Branco)', 60, 'camisa.padrao', 3, 'torso', false},
					[6] = {'Estampa NYC (Branco)', 60, 'camisa.padrao', 4, 'torso', false},
					[7] = {'Estampa SkateGirl (Branco)', 50, 'camisa.padrao', 5, 'torso', false},
					[8] = {'Estampa Ardidas (Branco)', 50, 'camisa.padrao', 6, 'torso', false},
					[9] = {'Estampa LoveFlower (Branco)', 50, 'camisa.padrao', 11, 'torso', false},
					[10] = {'Estampa Adidas Pink (Preto)', 60, 'camisa.padrao', 7, 'torso', false},
					[11] = {'Estampa Trasher (Preto)', 50, 'camisa.padrao', 8, 'torso', false},
					[12] = {'Estampa Adidas Graffiti (Preto)', 50, 'camisa.padrao', 9, 'torso', false},
					[13] = {'Estampa Louis Vitton', 50, 'camisa.padrao', 10, 'torso', false},
				},
				['Camisetas Topless'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'torso', false},
					[2] = {'Estampa Guffy Cinza', 60, 'camisa.pequena', 1, 'torso', false},
					[3] = {'Estampa Guffy Rosa', 60, 'camisa.pequena', 2, 'torso', false},
					[4] = {'Estampa Guffy Azul', 60, 'camisa.pequena', 3, 'torso', false},
					[5] = {'Estampa Guffy Laranja', 60, 'camisa.pequena', 4, 'torso', false},
					[6] = {'Estampa Guffy Verde', 60, 'camisa.pequena', 5, 'torso', false},
					[7] = {'Estampa Guffy Vermelho', 60, 'camisa.pequena', 6, 'torso', false},
					[8] = {'Estampa Adidas Branca', 60, 'camisa.pequena', 7, 'torso', false},
					[9] = {'Estampa Trasher Branca', 60, 'camisa.pequena', 8, 'torso', false},
					[10] = {'Estampa SquashCodes Roxa', 60, 'camisa.pequena', 9, 'torso', false},
					[11] = {'Estampa Lisa Laranja', 60, 'camisa.pequena', 10, 'torso', false},
					[12] = {'Estampa Lisa Verde', 60, 'camisa.pequena', 11, 'torso', false},
					[13] = {'Estampa Lisa Vermelho', 60, 'camisa.pequena', 12, 'torso', false},
					[14] = {'Estampa Lisa Amarelo', 60, 'camisa.pequena', 13, 'torso', false},
					[14] = {'Estampa Lisa Rosa', 60, 'camisa.pequena', 14, 'torso', false},
				},
				['Regatas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'torso', false},
					[2] = {'Regata Preta', 40, 'camisa.regata', 1, 'torso', false},
					[3] = {'Regata Branca', 40, 'camisa.regata', 2, 'torso', false},
					[4] = {'Regata Louis Vitton', 40, 'camisa.regata', 3, 'torso', false},
					[5] = {'Regata Listrada Amarela', 40, 'camisa.regata', 4, 'torso', false},
					[6] = {'Regata Listrada Laranja', 40, 'camisa.regata', 5, 'torso', false},
					[7] = {'Regata Listrada Roxa', 40, 'camisa.regata', 6, 'torso', false},
					[8] = {'Regata Listrada Preta', 40, 'camisa.regata', 7, 'torso', false},
				},
				['Jeans'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'legs', false},
					[2] = {'Calça Jeans Camo', 80, 'calca.padrao', 1, 'legs', false},
					[3] = {'Calça Jeans Camo Preta', 80, 'calca.padrao', 2, 'legs', false},
					[4] = {'Calça Jeans Camo Branca', 80, 'calca.padrao', 3, 'legs', false},
					[5] = {'Calça Jeans Azul', 80, 'calca.padrao', 4, 'legs', false},
					[6] = {'Calça Jeans Cinza', 80, 'calca.padrao', 5, 'legs', false},
					[7] = {'Calça Jeans Preta', 80, 'calca.padrao', 6, 'legs', false},
					[8] = {'Calça Jeans Branca', 80, 'calca.padrao', 7, 'legs', false},
				},
				['Tenis'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Tênis Verde', 50, 'pe.tenis3', 1, 'feet', false},
					[3] = {'Tênis Cinza', 50, 'pe.tenis3', 2, 'feet', false},
					[4] = {'Tênis Preto', 50, 'pe.tenis3', 3, 'feet', false},
					[5] = {'Tênis Branco', 50, 'pe.tenis3', 4, 'feet', false},
					[6] = {'Tênis Roxo', 50, 'pe.tenis3', 5, 'feet', false},
					[7] = {'Tênis Marrom', 50, 'pe.tenis3', 6, 'feet', false},
					[8] = {'Tênis Ciano', 50, 'pe.tenis3', 7, 'feet', false},
					[9] = {'Tênis Yeezy Branco', 70, 'Yeazzy', 1, 'feet', false},
				},
				['Sandália'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Sandália Azul', 20, 'pe.sandalia', 1, 'feet', false},
					[3] = {'Sandália Verde', 20, 'pe.sandalia', 2, 'feet', false},
					[4] = {'Sandália Amarelo', 20, 'pe.sandalia', 3, 'feet', false},
					[5] = {'Sandália Vermelho', 20, 'pe.sandalia', 4, 'feet', false},
					[6] = {'Sandália Roxo', 20, 'pe.sandalia', 5, 'feet', false},
					[7] = {'Sandália Cinza', 20, 'pe.sandalia', 6, 'feet', false},
				},
				['Acessórios'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Sem capacete', 0, '0', '0', 'head', true},
					[2] = {'Sem Oculos', 0, '0', '0', 'extra2', true},
					[3] = {'Capacete Off-Racing Azul', 50, 'capacete.padrao', 1, 'head', true},
					[4] = {'Capacete Off-Racing Rosa', 50, 'capacete.padrao', 2, 'head', true},
					[5] = {'Capacete Off-Racing Amarelo', 50, 'capacete.padrao', 3, 'head', true},
					[6] = {'Capacete Off-Racing Roxo', 50, 'capacete.padrao', 4, 'head', true},
					[7] = {'Capacete Off-Racing Verde', 50, 'capacete.padrao', 5, 'head', true},
					[8] = {'Capacete Off-Racing Preto', 50, 'capacete.padrao', 6, 'head', true},
					[9] = {'Capacete Off-Racing Branco', 50, 'capacete.padrao', 7, 'head', true},
					[10] = {'Óculos Juliet Rosa', 80, 'oculos.juliet', 1, 'extra2', true},
					[11] = {'Óculos Juliet Roxo', 80, 'oculos.juliet', 2, 'extra2', true},
					[12] = {'Óculos Juliet Azul', 80, 'oculos.juliet', 3, 'extra2', true},
					[13] = {'Óculos Juliet Verde', 80, 'oculos.juliet', 4, 'extra2', true},
					[14] = {'Óculos Juliet Amarelo', 80, 'oculos.juliet', 5, 'extra2', true},
					[15] = {'Óculos Juliet Branco', 80, 'oculos.juliet', 6, 'extra2', true},
					[16] = {'Óculos Juliet Cinza', 80, 'oculos.juliet', 8, 'extra2', true},
					[17] = {'Óculos Juliet Vermelho', 80, 'oculos.juliet', 9, 'extra2', true},
					[18] = {'Óculos Branco', 50, 'oculos.padrao', 1, 'extra2', true},
					[19] = {'Óculos Amarelo', 50, 'oculos.padrao', 2, 'extra2', true},
					[20] = {'Óculos Rosa', 50, 'oculos.padrao', 3, 'extra2', true},
					[21] = {'Óculos Azul', 50, 'oculos.padrao', 4, 'extra2', true},
					[22] = {'Óculos Verde', 50, 'oculos.padrao', 5, 'extra2', true},
					[23] = {'Óculos Vermelho', 50, 'oculos.padrao', 6, 'extra2', true},
				},
				['Maquiadora'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Sem Batom', 0, '0', '0', 'lipstick', true},
					[2] = {'Sem Blush', 0, '0', '0', 'blush', true},
					[3] = {'Batom Preto', 35, 'lipstick', 1, 'facehead', true},
					[4] = {'Batom Lilás', 35, 'lipstick', 2, 'facehead', true},
					[5] = {'Batom Castanho', 35, 'lipstick', 3, 'facehead', true},
					[6] = {'Batom Vermelho', 35, 'lipstick', 4, 'facehead', true},
					[7] = {'Batom Vermelho-Choque', 35, 'lipstick', 5, 'facehead', true},
					[8] = {'Batom Laranja', 35, 'lipstick', 6, 'facehead', true},
					[9] = {'Batom Nude', 35, 'lipstick', 8, 'facehead', true},
					[10] = {'Batom Vinho', 35, 'lipstick', 9, 'facehead', true},
					[11] = {'Batom Roxo', 35, 'lipstick', 10, 'facehead', true},
					[12] = {'Blush Bochecas', 65, 'blush', 1, 'facehead', true},
					[13] = {'Blush Nariz', 65, 'blush', 2, 'facehead', true},
					[14] = {'Blush Queixo', 65, 'blush', 3, 'facehead', true},
					[15] = {'Blush + Sardas', 65, 'blush', 4, 'facehead', true},
				},
			},
		},
	},

	barberPanel = {

		rgbprincipal = {129, 89, 247, 200}, --[[ R, G, B, ALPHA principal do painel ]]
		rgbsecundario = {255, 255, 255}, --[[ R, G, B secundário do painel ]]
		rgbbackground = {23, 23, 23, 170}, --[[ R, G, B, ALPHA background do painel ]]
			
		storeoptions = {
			enterMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {823.78363, -1588.64172, 13.55445, 0, 0, {129, 89, 247, 200}},
				[2] = {2071.18091, -1793.85730, 13.55328, 0, 0, {129, 89, 247, 200}},
				[3] = {-2571.16040, 246.49210, 10.26823, 0, 0, {129, 89, 247, 200}},
				[4] = {-1449.90466, 2592.28198, 55.83594, 0, 0, {129, 89, 247, 200}},
				[5] = {2072.82959, 2122.48633, 10.81252, 0, 0, {129, 89, 247, 200}},
			},
				
			enterPosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {418.29282, -82.69286, 1001.80469, 3, 1},
				[2] = {418.29282, -82.69286, 1001.80469, 3, 2},
				[3] = {418.29282, -82.69286, 1001.80469, 3, 3},
				[4] = {418.29282, -82.69286, 1001.80469, 3, 4},
				[5] = {418.29282, -82.69286, 1001.80469, 3, 5},
			},
	
			leaveMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {418.69260, -84.05727, 1001.80469, 3, 1, {129, 89, 247, 200}},
				[2] = {418.69260, -84.05727, 1001.80469, 3, 2, {129, 89, 247, 200}},
				[3] = {418.69260, -84.05727, 1001.80469, 3, 3, {129, 89, 247, 200}},
				[4] = {418.69260, -84.05727, 1001.80469, 3, 4, {129, 89, 247, 200}},
				[5] = {418.69260, -84.05727, 1001.80469, 3, 5, {129, 89, 247, 200}},
			},
	
			leavePosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {823.21954, -1592.03601, 13.55445, 0, 0},
				[2] = {2072.46118, -1793.40967, 13.54688, 0, 0},
				[3] = {-2569.69849, 245.18585, 10.19012, 0, 0},
				[4] = {-1450.82141, 2595.31616, 55.83594, 0, 0},
				[5] = {2073.56714, 2119.96484, 10.81252, 0, 0},
			},
	
			openMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {420.49435, -79.11149, 1001.80469, 3, 1, {129, 89, 247, 200}},
				[2] = {420.49435, -79.11149, 1001.80469, 3, 2, {129, 89, 247, 200}},
				[3] = {420.49435, -79.11149, 1001.80469, 3, 3, {129, 89, 247, 200}},
				[4] = {420.49435, -79.11149, 1001.80469, 3, 4, {129, 89, 247, 200}},
				[5] = {420.49435, -79.11149, 1001.80469, 3, 5, {129, 89, 247, 200}},
			},
	
			openLeavePosition = {
				[1] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 1},
				[2] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 2},
				[3] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 3},
				[4] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 4},
				[5] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 5},
			},

			pedPosition = { -- X, Y, Z, RX, RY, RZ, Interior, Dimensão
				[1] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[2] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[3] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[4] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[5] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
			},
	
			pedCamera = { -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam RZ
				[1] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[2] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[3] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[4] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[5] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ

			},

			blip = true, -- Caso esteja ativado, os blips serão criados na mesma posição dos markers de entrada da loja
			blipid = 7, -- ID do Blip
			blipdistance = 100,

		},

		--[[
			Tabela de cabelos / barba / sombrancelha

			['Modelo'] = {
				{Parte do Corpo, Valor, Textura},
			},
		]]
		
		['male'] = {
			['cabelos'] = {
				[1] = { 
					['0'] = { 
						{'head', 0, '0'},
					},
				},
				[2] = { 
					['Cabelo1'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
					},
				},
				[3] = {
					['Cabelo2'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
						{'head', 150, 10},
						{'head', 150, 11},
						{'head', 150, 12},
					},
				},
				[4] = {
					['Cabelo4'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
						{'head', 150, 10},
						{'head', 150, 11},
						{'head', 150, 12},
					},
				},
			},
			['barbas'] = {
				--[[1]] {
					['beard'] = {
						{'beard', '0', '0'} 
					}, 
				},
				--[[2]] { 
					['beard'] = {
						{'beard', 150, 1},
					},
				},
				--[[3]] { 
					['beard'] = {
						{'beard', 150, 2},
					},
				},
				--[[4]] { 
					['beard'] = {
						{'beard', 150, 3},
					},
				},
				--[[5]] { 
					['beard'] = {
						{'beard', 150, 4},
					},
				},
				--[[6]] {  
					['beard'] = {
						{'beard', 150, 5},
					},
				},
				--[[7]] { 
					['beard'] = {
						{'beard', 150, 6},
					},
				},
				--[[8]] { 
					['beard'] = {
						{'beard', 150, 7},
					},
				},
				--[[9]] { 
					['beard'] = {
						{'beard', 150, 8},
					},
				},
				--[[10]] { 
					['beard'] = {
						{'beard', 150, 9},
					},
				},
				--[[11]] { 
					['beard'] = {
						{'beard', 150, 10},
					},
				},
				--[[12]] { 
					['beard'] = {
						{'beard', 150, 11},
					},
				},
				--[[13]] { 
					['beard'] = {
						{'beard', 150, 12},
					},
				},
				--[[14]] { 
					['beard'] = {
						{'beard', 150, 13},
					},
				},
				--[[15]] {  
					['beard'] = {
						{'beard', 150, 14},
					},
				},
			},
			['sobrancelhas'] = {
				{
					['eyebrow'] = {
						{'eyebrow', '0', '0'},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 2},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 3},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 4},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 5},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 6},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 7},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 8},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 9},
					},
				},
			}
		},
		['female'] = {
			['cabelos'] = {
				[1] = { 
					['0'] = { 
						{'head', 0, '0'},
					},
				},
				[2] = { 
					['hair.1'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
					},
				},
				[3] = {
					['hair.3'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
					},
				},
				[4] = {
					['hair.4'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
						{'head', 150, 10},
					},
				},
			},
			['sobrancelhas'] = {
				{
					['eyebrow'] = {
						{'eyebrow', '0', '0'},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 1},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 2},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 3},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 4},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 5},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 6},
					},
				},
			},
		},
	},
	
	corpsPanel = {
		['rgbselected'] = {95, 21, 191, 255}, -- R,G,B de quando alguma roupa / customização estiver selecionada 
		['rgbprincipal'] = {129, 89, 247, 200}, -- R, G, B, ALPHA principal do painel 
		['rgbsecundario'] = {255, 255, 255}, -- R, G, B secundário do painel 
		['rgbbackground'] = {23, 23, 23, 170}, -- R, G, B, ALPHA background do painel 
		['rgbrectangle'] = {0, 0, 0, 170}, -- R, G, B, ALPHA dos retangulos do painel 
		['panels'] = {
		[1] = { 
				['openMarker'] = {2258.322, 1025.84, 10.82, 0, 0, {129, 89, 247, 200}}, -- posX, posY, posZ, interior, dimensão {r, g, b, alpha}
				['panelLogo'] = {"assets/interface/corps/logo_example.png", {x = 1390, y = 305, w = 91, h = 117}, {255, 255, 255, 255}}, -- logoFile, {x, y, w, h}, {r, g, b, alpha}
				['panelText'] = {"P.C.E.S.P", {x = 1532 + 5, y = 326, w = 272, h =75}, {255, 255, 255, 255}, fontSize = 40}, -- logoText, {x, y, w, h}, {r, g, b, alpha}, fontSize
				['grouptype'] = 'ElementData', -- 'ACL' ou 'ElementData' 
				['groupname'] = 'Policial',
				['options'] = {
					['male'] = {
						skin = 1, -- Número da skin
						['Farda Completa'] = { -- Nome da opção	
							openTable = false, --[[ Tabela secundária ou tabela primária? 
							Ex: Caso você coloque false, você não precisa colocar o nome das roupas nos argumentos do tableOptions, basta colocar a o modelo na txd, a textura e a parte do corpo.
								Caso seja false, ao clicar todas as roupas serão adicionadas ao corpo do personagem ao mesmo tempo
								Caso seja true, irá abrir uma aba secundária com mais opções de roupas para ao clicar adicionar a roupa ao corpo, um por um. ]]
							tableOptions = {
								{'camisa.padrao', 1, 'torso'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
								{'calca.jeans', 1, 'legs'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PC', 'painel.corp', 1, 'torso'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
								{'Calça PM', 'calca.jeans', 1, 'legs'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
							}, 
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Calça PM', 'calca.jeans', 1, 'legs'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PC', 'camisa.padrao', 4, 'torso'},
								{'Camisa PM', 'camisa.padrao', 1, 'torso'},
								{'Mascara Caveira', 'skull.mask', 1, 'extra2'},
							},
						},
						
					},
					['female'] = {
						skin = 2,
						['Farda Completa'] = {		
							openTable = false,
							tableOptions = {
								{'camisa.padrao', 1, 'torso'},
								{'calca.padrao', 1, 'legs'},
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
					},
				},
			},
			[2] = { 
				['openMarker'] = {2821.22876 + 10, 2376.74170, 11.06250, 0, 0, {129, 89, 247, 200}}, -- posX, posY, posZ, interior, dimensão {r, g, b, alpha}
				['panelLogo'] = {"assets/interface/corps/logo_example.png", {x = 1390, y = 305, w = 91, h = 117}, {255, 255, 255, 255}}, -- logoFile, {x, y, w, h}, {r, g, b, alpha}
				['panelText'] = {"P.C.E.S.P", {x = 1532 + 5, y = 326, w = 272, h =75}, {255, 255, 255, 255}, fontSize = 40}, -- logoText, {x, y, w, h}, {r, g, b, alpha}, fontSize
				['grouptype'] = 'ElementData', -- 'ACL' ou 'ElementData' 
				['groupname'] = 'PCESP',
				['options'] = {
					['male'] = {
						skin = 1, -- Número da skin
						['Farda Completa'] = { -- Nome da opção	
							openTable = false, --[[ Tabela secundária ou tabela primária? 
							Ex: Caso você coloque false, você não precisa colocar o nome das roupas nos argumentos do tableOptions, basta colocar a o modelo na txd, a textura e a parte do corpo.
								Caso seja false, ao clicar todas as roupas serão adicionadas ao corpo do personagem ao mesmo tempo
								Caso seja true, irá abrir uma aba secundária com mais opções de roupas para ao clicar adicionar a roupa ao corpo, um por um. ]]
							tableOptions = {
								{'camisa.padrao', 1, 'torso'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
								{'calca.padrao', 1, 'legs'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
								{'Colete PM', 'camisa.padrao', 1, 'torso'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
							}, 
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},					
					},
					['female'] = {
						skin = 2,
						['Farda Completa'] = {		
							openTable = false,
							tableOptions = {
								{'camisa.padrao', 1, 'torso'},
								{'calca.padrao', 1, 'legs'},
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
					},
				},
			},
		},
	},
}
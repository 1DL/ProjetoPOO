			<%-- 
				Document   : home
				Created on : Sep 8, 2017, 12:06:21 AM
			Author     : LuizV1
			--%>

		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		
		
		<!DOCTYP		E html>
		<html lang="pt-br">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<metacontent="width=device-width, initial-scale=1, maximum-scale=1"name="viewport">
				<link href="css/seu-stylesheet.css" rel="stylesheet"/>
				<title>JSP Page</title>
			</head>
			<body>
			<header>
			<nav>
			<legend><h1>Programação Orientada a Objetos - Segundo projeto</h1> 
		<p>Proposta: Cálculos para Amortização Americana e Constante</p></legend><br>
				<p>Integrantes: </p>
				<img align="rigth_top" src="home.jsp/imagens/github.pmg" alt="Logo do Github">
				<ul>
				<li>Gabriel Damico - <a href="https://github.com/Gabrieldmc">@Gabrieldmc</a></li>
				<li>Luciana Oliveira - <a href="https://github.com/LucyMachado">@LucyMachado</a></li>
				<li>Luiz Henrique - <a href="https://github.com/1DL">@1DL</a></li>
				
				<li><aside><a href="https://github.com/">Ir Para O Projeto Final</a></aside></li><br>
				</ul></nav><br><hr>
				</header>
				<nav class="section">
				<img align="right" src="home.jsp/imagens/cifrao.pmg" alt="Imagem de Um Cifrão">
				<legend><h2>Faça uma simulação e avalie</h2>
				<p>Por favor, siga As Instruções Abaixo: <p></legend><br>
				<form>
				<form method="POST" ACTION=" ">
				<fieldset>
				
				<label>Escolha O Tipo de Amortização><select id="radio">
				<option>Amortização Americana</option>
				<option>Amortização Constante</option>
				</select></label>
				<br>
				<label>Juros><input type="number" value=" "></label>
				
				<label>Valor><input type="number" required pattern="[0-9]+$"></label>

				<label>Meses<input type="text" required ></label>
				<br>
				<button type="submit">Calcular</button>
				</fieldset>
				</form>
				</nav>
				</header>
				<br>
				<footer>
				<small>Desenvolvido pelo grupo 02 Vespertino</small>
				<footer>
			</body>
			</html>
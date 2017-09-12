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
        <title>Sistema de Amortização</title>
    </head>
    <body background="imagens/bg.jpg">
        <%@include file="WEB-INF/jspf/header.jspf" %>
  
        <header>
            <nav>
                <legend><h1>Programação Orientada a Objetos - Segundo projeto</h1> 
                    <h2>Proposta:</h2>
                    <font face ="verdana" size="3"><b>Esta aplicação web tem como 
                        objetivo gerar tabelas, de acordo com o tipo de Amortização 
                        de um financiamento desejado. Para esse projeto, os tipos
                        de financiamento disponíveis são: Amortização Constante,
                        Amortização Americana, e financiamento baseado na Tabela Price. </b></font></p></legend>
                <hr>
                <center><h1>Integrantes: <h1></center>
                <div><center>
                    <h2><img src="imagens/gabriel.jpg" alt="Gabriel Damico"><br>
                    Gabriel Damico - <a href="https://github.com/gabrieldamc">@Gabrieldmc</a></h2>
                    <h2><img src="imagens/luciana.jpg" alt="Luciana Oliveira"><br>
                    Luciana Oliveira - <a href="https://github.com/LucyMachado">@LucyMachado</a></h2>
                    <h2><img src="imagens/luiz.jpg" alt="Luiz Henrique"><br>
                    Luiz Henrique - <a href="https://github.com/1DL">@1DL</a></h2>
                </div></center>
                    <center><img src="imagens/github.png" alt="Logo do Github">
                    <h2><a href="https://github.com/1DL/ProjetoPOO">Ir Para O repositório no GitHub</a></h2></center><br>
                </ul></nav>
        </header>
        
        <center><%@include file="WEB-INF/jspf/menu.jspf"%></center>
        <center><%@include file="WEB-INF/jspf/footer.jspf"%></center>
        
                
                </body>
                </html>
              
<!--<form>
                <form method=get ACTION=" ">
                    <fieldset>

                        <label>Escolha O Tipo de Amortização<select id="radio">
                                <option>Amortização Americana</option>
                                <option>Amortização Constante</option>
                                <option>Tabela Price</option>
                            </select></label>
                        <br>
                        <label>Juros<input type="number" value=" "></label>

                        <label>Valor<input type="number" required pattern="[0-9]+$"></label>

                        <label>Meses<input type="text" required ></label>
                        <br>
                        <button type="submit">Calcular</button>
                    </fieldset>
                </form>
                -->
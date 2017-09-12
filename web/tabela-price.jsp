<%-- 
    Document   : tabela-price
    Created on : Sep 8, 2017, 12:08:05 AM
    Author     : LuizV1
--%>

<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1><b><center>Financiamento pela Tabela Price</center></b></h1>
    <center>
        <%
            //Declaração de variaveis
            double pv = 0;      //Capital / Saldo Devedor
            double i = 0;       //Taxa de Juros
            double pmt = 0;     // Parcela
            double juros = 0;   //Valor do juros
            double a = 0;       //Amortização
            int n = 0;          //Quantidade de Parcelas
            double total[] = {0, 0, 0}; //Total, 0 = total juros, 1 = total parcela, 2= total amortização
            
            /*Máscara para formatar os valores. Objeto declarado como formata.
            seu uso é: formata.format(valor); onde o parametro é o valor desejado
            a ser formatado.
            */
            DecimalFormat formata = new DecimalFormat("###,###,###,###,##0.00"); 
        %>
        <%!//Segmento de código dedicado a métodos Java
            
            /*
            Método verifica realiza a conversão dos valores em String
            e retorna eles em double. Se caso algum erro ocorra, retorna um valor negativo,
            que será verificado na atribuição de valores as variáveis futuramente.
            Se as variáveis conterem valores negativos, a tabela não será gerada.
            */
            public double verifica(String vlrStr) {

                double valor = 0;
                try {
                    valor = Double.parseDouble(vlrStr);
                } catch (Exception ex) {
                    valor = -1;
                }
                return valor;
            }
            /* 
            Método parcela retorna o valor da parcela, de acordo com a tabela Price.
            Requer 3 parametros, o Capital em double, Taxa de juros em double
            e por último a quantidade de parcelas, em inteiro.
            Fórmula: pmt = pv * 1 + i^n * 1 / 1 + i^n -1
            */
            public double parcela(double pv, double i, int n) {
                double pmt = 0;
                try {
                    pmt = pv * (Math.pow((1 + i), n) * i) / (Math.pow((1 + i), n) - 1);
                } catch (Exception ex) {
                }
                return pmt;
            }


        %>
        <% 
            /*
            Segmento de código dedicado a atribuição de valores as variáveis.
            Caso o método verifica retornar um valor igual ou maior que zero,
            será atribuido o valor dos campos a sua respectiva variável.
            A utilização do mesmo está dessa forma:
            Se, o metodo verifica, parametrizado com o request do campo X,
            retorna um valor maior ou igual a zero, ele atribui a variável
            o retorno desse mesmo método.
            */
            if (verifica(request.getParameter("txtValor")) >= 0) {
                pv = verifica(request.getParameter("txtValor"));

            }

            if (verifica(request.getParameter("txtParcelas")) >= 0) {
                /*
                Método verifica retorna somente doubles. foi utilizado
                o comando (int) antes do método, para que o valor double 
                seja convertido para int no momento da atribuição do mesmo 
                na variável n.                
                */
                n = (int) verifica(request.getParameter("txtParcelas"));
            }
            if (verifica(request.getParameter("txJuros")) >= 0) {
                /*
                Atribuição da taxa de juros. Nesse caso em específico,
                o valor do campo de taxa de juros, é parametrizado já divido
                por 100 no método verifica. Dessa forma, um valor digitado
                inteiro é convertido para 0,0x, onde x é o valor inteiro
                digitado.
                */
                i = (verifica(request.getParameter("txJuros")) / 100);

            }
            /*
            Método parcela calcula o valor das parcelas da tabela Price.
            é parametrizado, nessa ordem: capital, taxa de juros e 
            quantidade de parcelas.
            */
            pmt = parcela(pv, i, n);

        %>

        <%@include file="WEB-INF/jspf/form.jspf"%> <!--Segmento com os campos de entrada de dados-->
               
        <div>
            <%
            /*
            Se as três variáveis forem maior que zero, a criação da tabela é iniciada.
            Caso algum dos valores seja negativo, a criação não é realiada.
            */
            if (pv > 0 && n > 0 && i > 0) {%>


            <br>
            <table border="1" bgcolor="#FFFFFF">
                
                <tr  bgcolor="#E3F6CE">
                    <th>Número da Parcela</th>
                    <th>Juros</th>
                    <th>Valor da Parcela</th>
                    <th>Amortização</th>
                    <th>Saldo Devedor</th>

                </tr>
                <tr>
                    <td><center>-</center></td>
                <td><center>-</center></td>
                <td><center>-</center></td>
                <td><center>-</center></td>
                <td><center><%=pv%></center></td>
                </tr>
                <%for (int j = 1; j <= n; j++) {
                    /*
                    For é iniciado para gerar a tabela dinamicamente.
                    Contador é expresso em j, porquê a variável i é local,
                    utilizada para representar a taxa de juros.
                    */

                    juros = pv * i;     //valor do juros = saldo devedor * taxa de juros
                    a = pmt - juros;    //amortização = parcela - valor do juros
                    pv = pv - a;        //saldo devedor = saldo devedor - amortização

                    /*
                    Total é incrementado com seus respectivos valores
                    */
                    
                    total[0] += juros;
                    total[1] += pmt;
                    total[2] += a;
                    
                    %>
                
                   
                <tr> 
                    <td><center><%=j%></center></td>
                <td><center><%=formata.format(juros)%></center></td>
                <td><center><%=formata.format(pmt)%></center></td>
                <td><center><%=formata.format(a)%></center></td>
                <td><center><%=formata.format(pv)%></center></td>
                </tr>
                <%}%>
                <tr  bgcolor="#E3F6CE"><!--Ultima linha da tabela é manual, concatenando o total de cada valor-->
                    <td><center><b>TOTAL</b></center></td>
                <td><center><%=formata.format(total[0])%></center></td>
                <td><center><%=formata.format(total[1])%></center></td>
                <td><center><%=formata.format(total[2])%></center></td>
                <td><center><%=formata.format(0)%></center></td>
                </tr>
            </table>
            <%}%>
        </div>
        
        <h3> Sobre a Tabela Price: </h3>
        <textarea rows="12" cols="70">Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais. O método foi apresentado em 1771 por Richard Price em sua obra "Observações sobre Pagamentos Remissivos" (em inglês: Observations on Reversionary Payments).

O método foi idealizado pelo seu autor para pensões e aposentadorias. No entanto, foi a partir da 2ª revolução industrial que sua metodologia de cálculo foi aproveitada para cálculos de amortização de empréstimo.

Texto retirado da Wikipédia.
        </textarea>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <%@include file="WEB-INF/jspf/footer.jspf"%> <!--Rodapé -->
        
    </center>
</body>
</html>

<%-- 
    Document   : amortizacao-constante
    Created on : Sep 8, 2017, 12:07:07 AM
    Author     : LuizV1
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1><b><center>Amortização Constante, ou SAC</center></b></h1>
    <center>
        
        <%@include file="WEB-INF/jspf/menu.jspf"%>

        <% try {
                DecimalFormat formata = new DecimalFormat("###,###,###,###,##0.00");
                //criação das variáveis para capturar valores do formulário

                double valor = 0.00, juros = 0.00, calcJuros = 0.00, amortizacao = 0;
                int parc = 0;
                

                if (request.getParameter("btnCalcula") != null) {
                    valor = Double.parseDouble(request.getParameter("txtValor"));
                    juros = Double.parseDouble(request.getParameter("txJuros"));
                    parc = Integer.parseInt(request.getParameter("txtParcelas"));
                    if (valor > 0 && juros > 0 && parc > 0) {
                        double[] prestacao = new double[parc];
                        double[] txJuros = new double[parc];
                        double[] salorc = new double[parc];
                        double[] saldve = new double[parc];

                        amortizacao = (valor / parc);
                        txJuros[0] = valor * (juros / 100);

                        saldve[0] = valor - amortizacao;
                        prestacao[0] = amortizacao + txJuros[0];


        %>
        <br>
        <table border="1">
            <tr>
                <th>Número da Parcela</th>
                <th>Juros</th>
                <th>Valor da parcela</th> 
                <th>Amortização</th>
                
                <th>Saldo Devedor</th>
            </tr>

            <tr>
                <td><center>-</center></td>
            <td><center> - </center></td>
            <td><center> - </center></td>
            <td><center> - </center></td>
            <td><center><%=formata.format(valor)%></center></td>
            </tr>  

            <tr>
                <td><center>1</center></td>
            <td><center> <%=formata.format(txJuros[0])%> </center></td>
            <td><center><%=formata.format(prestacao[0])%></center></td>
            <td><center> <%=formata.format(amortizacao)%> </center></td><td><center> <%=formata.format(saldve[0])%> </center></td>
            </tr> 

            <%for (int i = 1; i < parc; i++) {
                    saldve[i] = saldve[i - 1] - amortizacao;
                    txJuros[i] = saldve[i - 1] * (juros / 100);
                    prestacao[i] = amortizacao + txJuros[i];
                    
                    
            %>
            <tr>
                <td><center><%=(i + 1)%></center></td>
        <td><center><%=formata.format(txJuros[i])%></center></td>
            <td><center><%=formata.format(prestacao[i])%></center></td>
            <td><center><%=formata.format(amortizacao)%></center></td>
            <td><center><%=formata.format(saldve[i])%></center></td>
            </tr>       

            <%}%>
            
            <%} else {%>
            <span style="color: red"><h2><center>Digite apenas números positivos!</center></h2></span>
                        <%}%>
        </table>
        <%}%>


    <%} catch (Exception ex) { //devolvendo erro ao usuário caso tenha digitado letras%>
    <span style="color: red"><h2><center>Digite apenas números positivos!</center></h2></span>
                <%}%>
    </center>
</body>
</html>

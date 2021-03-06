<%-- teste commit
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
        <title>Amortização Americana</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1><b><center>Amortização Americana</center></b></h1>
    <center>
        
        <%@include file="WEB-INF/jspf/form.jspf"%>

        <% try {
                DecimalFormat formata = new DecimalFormat("###,###,###,###,##0.00");
                //criação das variáveis para capturar valores do formulário

                double valor = 0.00, juros = 0.00, calcJuros = 0.00, amortizacao = 0.00,total = 0.00; ;
                int parc = 0;
                double total2[] = {0,0,0};
                

                if (request.getParameter("btnCalcula") != null) {
                    valor = Double.parseDouble(request.getParameter("txtValor"));
                    juros = Double.parseDouble(request.getParameter("txJuros"));
                    parc = Integer.parseInt(request.getParameter("txtParcelas"));
                    if (valor > 0 && juros > 0 && parc > 0) {
                        double[] prestacao = new double[parc];
                        double[] txJuros = new double[parc];
                        double[] valorc = new double[parc];
                        double[] saldve = new double[parc];
                       
                        


        %>
        <br>
        <table border="1">
            <tr bgcolor="#E3F6CE">
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
          

            <%for (int i = 0; i < parc; i++) {
                    amortizacao = 0;    
                    saldve[i] = valor;
                    txJuros[i] = valor * (juros / 100);
                    prestacao[i] = amortizacao + txJuros[i];
                    
                    
                    
                    if (i == (parc - 1)){   
            %>
                  
            <tr bgcolor="#E3F6CE">
                <td><center><b>TOTAL</b></center></td>
            <td><center><%=formata.format(txJuros[i])%></center></td>
            <td><center><%=formata.format(valor + txJuros[i])%></center></td>
            <td><center><%=formata.format(valor)%></center></td>
            <td><center> - </center></td>
            </tr>
            
            <%} else {%>
                <tr>
                    <td><center><%= i %></center></td>
                    <td><center><%=formata.format(txJuros[i])%></center></td>
                    <td><center><%=formata.format(prestacao[i])%></center></td>
                    <td><center><%=formata.format(amortizacao)%></center></td>
                    <td><center><%=formata.format(saldve[i])%></center></td>
                </tr> 
            <%}%>
            
            
             
        <%}%>
        
                
                        
    <%}%>
       
        </table>
<%}%>


    <%} catch (Exception ex) { //devolvendo erro ao usuário caso tenha digitado letras%>
    <span style="color: red"><h2><center>Digite apenas números positivos!</center></h2></span>
                <%}%>
    <h3> Sobre a Amortização Americana: </h3>
        <textarea rows="12" cols="70">O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida,deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.

Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, pois nele não há incidência de juros sobre juros. Os juros sempre incidem sobre o valor original da dívida. Com isso o devedor pode quitar sua dívida quando quiser.

Tem como desvantagem que o pagamento de juros pode, em tese, ser perpétuo mesmo quando já se pagou o equivalente à dívida em si. Para isso, basta que o número de prestações exceda 100% quando da soma dos juros simples.

Texto retirado da Wikipédia.
        </textarea>
    <%@include file="WEB-INF/jspf/menu.jspf"%>
    <%@include file="WEB-INF/jspf/footer.jspf"%> <!--Rodapé -->
    </center>
</body>
</html>

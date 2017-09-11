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
        <div>


            <form name ="frmconstante">
                <table>
                    <tr align="left"><th>
                            <font face ="verdana" size="3"><b>Valor: R$ </b></font></th>
                        <th>
                            <input type="number" name="txtValor" placeholder="Insira o capital R$" size="5"/>
                        </th>
                    </tr> 
                    <tr align="left"><th>
                            <font face ="verdana" size="3"><b>Número de Parcelas:</b></font></th>
                        <th>
                            <input type="number" name="txtParcelas" placeholder="Insira o número de parcelas"/></th>
                    </tr>
                    <tr align="left"><th>
                            <font face ="verdana" size="3"><b>Taxa de Juros:</b></font></th>
                        <th>
                            <input type="number" name="txJuros" placeholder="Insira a taxa de juros" size="5"/>
                        </th>
                    </tr>
                </table>
                <input type="submit" name="btnCalcula" value="Analisar"/>
            </form>

        </div>

        <% try {
                DecimalFormat formata = new DecimalFormat("###,###,###,###,##0.00");
                //criação das variáveis para capturar valores do formulário

                double valor = 0.00, juros = 0.00, CalcJuros = 0.00, Amortizacao = 0;
                int parc = 0;

                if (request.getParameter("btnCalcula") != null) {
                    valor = Double.parseDouble(request.getParameter("txtValor"));
                    juros = Double.parseDouble(request.getParameter("txJuros"));
                    parc = Integer.parseInt(request.getParameter("txtParcelas"));
                    if (valor > 0 && juros > 0 && parc > 0) {
                        double[] prestacao = new double[parc];
                        double[] txJuros = new double[parc];
                        double[] Valorc = new double[parc];
                        double[] Saldve = new double[parc];

                        Amortizacao = (valor / parc);
                        txJuros[0] = valor * (juros / 100);

                        Saldve[0] = valor - Amortizacao;
                        prestacao[0] = Amortizacao + txJuros[0];


        %>
    <center><table border="1">
            <tr>
                <th>Número da parc</th>
                <th>Valor parcela</th> 
                <th>Amortização</th>
                <th>Juros</th>
                <th>Saldo dev</th>
            </tr>

            <tr>
                <td><center>0</center></td>
            <td><center> - </center></td>
            <td><center> - </center></td>
            <td><center> - </center></td>
            <td><center><%=formata.format(valor)%></center></td>
            </tr>  

            <tr>
                <td><center>1</center></td>
            <td><center><%=formata.format(prestacao[0])%></center></td>
            <td><center> <%=formata.format(Amortizacao)%> </center></td>
            <td><center> <%=formata.format(txJuros[0])%> </center></td>
            <td><center> <%=formata.format(Saldve[0])%> </center></td>
            </tr> 

            <%for (int i = 1; i < parc; i++) {
                    Saldve[i] = Saldve[i - 1] - Amortizacao;
                    txJuros[i] = Saldve[i - 1] * (juros / 100);
                    prestacao[i] = Amortizacao + txJuros[i];
            %>
            <tr>
                <td><center><%=(i + 1)%></center></td>
            <td><center><%=formata.format(prestacao[i])%></center></td>
            <td><center><%=formata.format(Amortizacao)%></center></td>
            <td><center><%=formata.format(txJuros[i])%></center></td>
            <td><center><%=formata.format(Saldve[i])%></center></td>
            </tr>       

            <%}%>
            <%} else {%>
            <span style="color: red"><h2><center>Digite apenas números positivos!</center></h2></span>
                        <%}%>
        </table></center>
        <%}%>


    <%} catch (Exception ex) { //devolvendo erro ao usuário caso tenha digitado letras%>
    <span style="color: red"><h2><center>Digite apenas números positivos!</center></h2></span>
                <%}%>

</body>
</html>

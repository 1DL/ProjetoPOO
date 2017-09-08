<%-- 
    Document   : amortizacao-constante
    Created on : Sep 8, 2017, 12:07:07 AM
    Author     : LuizV1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização constante</title>
    </head>
    <body>
        <h1><b><center>Amorticação Constante, ou SAC</center></b></h1>
        
        <div>        
            <form name ="frmcalculo">
                <input type="number" name="valorc" placeholder="R$" value=""/>
                <input type="number" name="txjuros" placeholder="%" value=""/>
                <input type="number" name="parcelas" placeholder="Número de parcelas" value=""/>
                <br>
                <input type="submit" name="btcalcula" value="Analisar"
            </form>
        </div>
        
        <%  Double Valor =  Double.parseDouble(request.getParameter("valorc"));
            Double juros =  Double.parseDouble(request.getParameter("txjuros")); 
            int parc     =  Integer.parseInt(request.getParameter("parcelas"));
            Double saldve;
            Double valrparc;
            Double txjuros;
            Double amortizacao;
            
            txjuros = juros/100;
            valrparc =parc + txjuros;
            amortizacao= Valor/parc;
          %>
            
            <table border="1">
                 <tr>
                <th>numero parcela</th>
                <th>Valor parcela</th> 
                <th>Amortização</th>
                <th>Juros</th>
                <th>Saldo dev</th>
                </tr>
            <% for (int i=0; i <= parc; i++){ 
            %>         
            <tr>
                <td><%=i%></td>
                <td><%=valrparc%></td>
                <td><%=amortizacao%></td>
                <td><%juros = Valor*txjuros;%></td>
                <td><% saldve= Valor - valrparc;  %></td>
            </tr>
            <%}
            %>
              </table>
            
           
            
        
        
        

        
    </body>
</html>

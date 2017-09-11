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
        <h1><b><center>Amorticação Constante, ou SAC</center></b></h1>
      
        <div>
          <center>
              <form name ="frmconstante">
                Valor:
                <input type="number" name="txtValor" placeholder="Insira o capital R$"/>
                <br>
                Juros:
                <input type="number" name="txJuros" placeholder="Insira os valor dos juros"/>
                <br>
                Número de Parcelas:
                <input type="number" name="txtParcelas" placeholder="Número de parcelas"/>
                <br>
                <input type="submit" name="btnCalcula" value="Analisar"/>
            </form>
          </center>
        </div>
        
 <% try
{
       DecimalFormat formata = new DecimalFormat("###,###,###,###,###.##");
      //criação das variáveis para capturar valores do formulário
      String parametroCalcular = request.getParameter("btnCalcula");
                
      double valor = 0.00, juros = 0.00, CalcJuros = 0.00,
      prestacao = 0, Amortizacao = 0, txJuros = 0.00, Prestacao = 0.00, Saldve = 0.00;
      int parc = 0; 
      String semValor = "-";
               
                if (parametroCalcular != null) 
                {valor =  Double.parseDouble(request.getParameter("txtValor"));
                juros =  Double.parseDouble(request.getParameter("txJuros")); 
                parc  =  Integer.parseInt(request.getParameter("txtParcelas"));
                juros = juros/100;
                %>
        <table border="1">
                <tr>
                <th>Número da parc</th>
                <th>Valor parcela</th> 
                <th>Amortização</th>
                <th>Juros</th>
                <th>Saldo dev</th>
                </tr>
                
            <%for (int i = 0; i <= parc; i++)
              {      
                  txJuros = juros * valor;
                  prestacao   = parc + txJuros ;
                  Amortizacao = (valor/parc);
                  Saldve = valor - Amortizacao;
            %>
                <tr>
                <td><center><%=i%></center></td>
                <td><center><%=formata.format(prestacao)%></center></td>
                <td><center><%=formata.format(Amortizacao)%></center></td>
                <td><center><%=formata.format(txJuros)%></center></td>
                <td><center><%=formata.format(Saldve)%></center></td>
                </tr>
            <%}%>
       
            <%}else if(parc==1){ //Em caso de ser uma parcela%>
                <tr>
                <td><center><%= parc %></center></td>
                <td><center><%= formata.format(valor) %></center></td>
                <td><center><%= semValor %></center></td>
                <td><center><%= semValor %></center></td>
                <td><center><%= semValor %></center></td>
                </tr>                            
            <%}else{//Caso não seja nenhuma das anteriores%>
                <tr>
                <td><center><%= semValor %></center></td>
                <td><center><%= semValor %></center></td>
                <td><center><%= semValor %></center></td>
                <td><center><%= semValor %> </center></td>
                <td><center><%= semValor %></center></td>
                </tr> 
            
           <%}%>
             </table>
       
        <%}
            catch(Exception ex){ //devolvendo erro ao usuário caso tenha digitado letras%>
            <span style="color: red"><h2>Digite apenas números!!!</h2></span>
            <%}%>
         
    </body>
</html>

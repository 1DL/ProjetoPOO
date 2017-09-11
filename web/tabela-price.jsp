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
        <%
            String c = "%";
            double p = 0;
            double pv = 0;
            double i = 0;
            double pmt = 0;
            double juros = 0;
            double a = 0;
            int n = 0;
            String msg[] = {"", "", ""};
            boolean flag = true;
            
           
            
            try {

            } catch (Exception ex) {
            }


        %>
        <%!
            public double verifica(String vlrStr) {

                double valor = 0;
                try {
                    valor = Double.parseDouble(vlrStr);
                } catch (Exception ex) {
                    valor = -1;
                }
                return valor;
            }

            public double parcela(double pv, double i, int n) {
                double pmt = 0;
                try {
                pmt = pv * (Math.pow((1+i), n) * i )/(Math.pow((1+i), n) - 1);
                } catch (Exception ex) {}
                return pmt;
            }

            
        %>
        <% //montante = BigDecimal.valueOf(montante).setScale(2, RoundingMode.HALF_UP).doubleValue();
            if (verifica(request.getParameter("pv")) >= 0) {
                pv = verifica(request.getParameter("pv"));
                pv = BigDecimal.valueOf(pv).setScale(2, RoundingMode.UP).doubleValue();
            } else {
                msg[0] = "Valor incorreto.";
                
            }
            if (verifica(request.getParameter("n")) >= 0) {
                n = (int) verifica(request.getParameter("n"));
            } else {
                msg[1] = "Quantidade de Parcelas inválida.";
            }
            if (verifica(request.getParameter("i")) >= 0) {
                i = (verifica(request.getParameter("i"))/100);
                i = BigDecimal.valueOf(i).setScale(2, RoundingMode.HALF_UP).doubleValue();
            } else {
                msg[2] = "Taxa de juros inválida.";
            }

            pmt = parcela(pv, i, n);
            
        %>
        <form name="frm_price" method="get">
            <br>
            <div>
                <table>
                    <tr align="left">
                        <th>
                            <font face ="verdana" size="3"><b>Valor: R$ </b></font>
                        </th>
                        <th>
                            <input type="text" name="pv" value="<%=pv%>" size="10"/>
                        </th>
                    </tr>
                    <tr align="left">
                        <th>
                            <font face ="verdana" size="3"><b>Número de Prestações: </b></font>
                        </th>
                        <th>
                            <input type="text" name="n" value="<%=n%>" size="10"/>
                        </th>
                    </tr>
                    <tr align="left">
                        <th>
                            <font face ="verdana" size="3"><b>Taxa de Júros: </b></font>
                        </th>
                        <th>
                            <input type="text" name="i" value="<%=(i*100)%>" size="10"/>
                            %
                        </th>
                    </tr>
                </table>
                <input type="submit" name="calcular" value="Gerar Tabela"/>
                
                
            </div>

        </form>
        <div>
            <%
                if (pv > 0 && n > 0 && i > 0) {%>

            <h4>Tabela:</h4>

            <table border="1">
                <tr>
                    <th>Mês</th><th>Saldo Devedor</th><th>Parcela</th><th>Juros</th><th>Amortizaçãor</th>
                </tr>
                <tr>
                    <td></td><td></td><td></td><td></td><td><%=pv%></td>
                </tr>
                <%for (int j = 1; j <= n; j++) {
                    pmt = BigDecimal.valueOf(pmt).setScale(2, RoundingMode.HALF_UP).doubleValue();
                    
                    juros = pv * i;
                    juros = BigDecimal.valueOf(juros).setScale(2, RoundingMode.HALF_UP).doubleValue();
                    
                    a = pmt - juros;
                    a = BigDecimal.valueOf(a).setScale(2, RoundingMode.HALF_UP).doubleValue();
                    
                    pv = pv - a;
                    pv = BigDecimal.valueOf(pv).setScale(2, RoundingMode.UP).doubleValue();
                    if (j == n) {
                        pv = 0.00;
                    }
                
                %>
                
                <tr>
                    <td><%=j%></td><td><%=pv%></td><td><%=pmt%></td><td><%=juros%></td><td><%=a%></td>
                    
                </tr>
                <%}%>
            </table>
            <%}%>
        </div>
    </body>
</html>

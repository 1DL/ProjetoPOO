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
        <h1><b><center>Financiamento Price</center></b></h1>
    <center>
                    <%
                        String c = "%";
                        double p = 0;
                        double pv = 0;
                        double i = 0;
                        double pmt = 0;
                        double juros = 0;
                        double a = 0;
                        int n = 0;
                        double total[] = {0,0,0}; 

                       
                        DecimalFormat formata = new DecimalFormat("###,###,###,###,##0.00");

                        


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
                                pmt = pv * (Math.pow((1 + i), n) * i) / (Math.pow((1 + i), n) - 1);
                            } catch (Exception ex) {
                            }
                            return pmt;
                        }


                    %>
                    <% //montante = BigDecimal.valueOf(montante).setScale(2, RoundingMode.HALF_UP).doubleValue();
                        if (verifica(request.getParameter("txtValor")) >= 0) {
                            pv = verifica(request.getParameter("txtValor"));

                        }

                        if (verifica(request.getParameter("txtParcelas")) >= 0) {
                            n = (int) verifica(request.getParameter("txtParcelas"));
                        }
                        if (verifica(request.getParameter("txJuros")) >= 0) {
                            i = (verifica(request.getParameter("txJuros")) / 100);

                        }
                        pmt = parcela(pv, i, n);

                    %>
        
                    <%@include file="WEB-INF/jspf/menu.jspf"%>
        <div>
            <%if (pv > 0 && n > 0 && i > 0) {%>

            
            <br>
            <table border="1">
                <tr>
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

                        juros = pv * i;
                        a = pmt - juros;
                        pv = pv - a;
                        
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
                <tr>
                    <td><center>TOTAL</center></td>
                    <td><center><%=formata.format(total[0])%></center></td>
                    <td><center><%=formata.format(total[1])%></center></td>
                    <td><center><%=formata.format(total[2])%></center></td>
                    <td><center><%=formata.format(0)%></center></td>
                </tr>
            </table>
            <%} 
            
            %>
        </div>
    </center>
    </body>
</html>

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

            boolean flag = true;
            DecimalFormat formata = new DecimalFormat("###,###,###,###,##0.00");

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
                    pmt = pv * (Math.pow((1 + i), n) * i) / (Math.pow((1 + i), n) - 1);
                } catch (Exception ex) {
                }
                return pmt;
            }


        %>
        <% //montante = BigDecimal.valueOf(montante).setScale(2, RoundingMode.HALF_UP).doubleValue();
            if (verifica(request.getParameter("pv")) >= 0) {
                pv = verifica(request.getParameter("pv"));

            }

            if (verifica(request.getParameter("n")) >= 0) {
                n = (int) verifica(request.getParameter("n"));
            }
            if (verifica(request.getParameter("i")) >= 0) {
                i = (verifica(request.getParameter("i")) / 100);

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
                            <input type="number" name="pv" value="<%=pv%>" size="10"/>
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
                            <input type="number" name="i" value="<%=(i * 100)%>" size="10"/>
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
                    <th>Mês</th><th>Saldo Devedor</th><th>Parcela</th><th>Juros</th><th>Amortização</th>
                </tr>
                <tr>
                    <td></td><td></td><td></td><td></td><td><%=pv%></td>
                </tr>
                <%for (int j = 1; j <= n; j++) {

                        juros = pv * i;

                        a = pmt - juros;

                        pv = pv - a;

                %>

                <tr>
                    <td><%=j%></td><td><%=formata.format(pv)%></td><td><%=formata.format(pmt)%></td><td><%=formata.format(juros)%></td><td><%=formata.format(a)%></td>

                </tr>
                <%}%>
            </table>
            <%}%>
        </div>
    </body>
</html>

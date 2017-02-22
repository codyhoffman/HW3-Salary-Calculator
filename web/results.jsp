<%-- 
    Document   : results
    Created on : Feb 21, 2017, 5:38:30 PM
    Author     : codyhoffman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Salary Results </title>
    </head>
    
    <%
        double hoursWorked = Double.parseDouble(request.getParameter("hours"));
        double hourlyPay =  Double.parseDouble(request.getParameter("hourlyPay"));
        double preTaxDeduct =  Double.parseDouble(request.getParameter("preTax"));
        double postTaxDeduct =  Double.parseDouble(request.getParameter("postTax"));
        double regularPay = hourlyPay * 40;
        double overtime = 0;
        double grossPay = 0;
        double overtimeRate = 1.5 * hourlyPay;
        double overtimePay = 0;
        double taxablePay = 0;
        double taxAmount = 0;
        double postTaxPay = 0;
        double netPay = 0;
        
        if(hoursWorked > 40)
        {
            overtime = hoursWorked - 40;
            overtimePay = overtime * overtimeRate;
            grossPay = regularPay + overtimePay;
        }
        else
        {
            grossPay = hoursWorked * hourlyPay;
        }
        taxablePay = grossPay - preTaxDeduct;
        
        if (grossPay < 500)
        {
            taxAmount = (taxablePay * .18);
        }
        else
        {
            taxAmount = (taxablePay *.22);
        }
        
        postTaxPay = taxablePay - taxAmount;
        netPay = postTaxPay - postTaxDeduct;
        %>
    
    <body>
        <h1>Salary info</h1>
        
        <table id = "output">
            <tbody>
                <tr>
                    <th class="label"> Total Hours Worked: </th>   
                    <td class="val">$<%= hoursWorked %>  </td>
                </tr>
                <tr>
                    <th class="label"> Hourly Rate: </th>   
                    <td class="val"> $<%= hourlyPay %>  </td>
                </tr>
                <tr>
                    <th class="label"> # Hours Overtime:  </th>   
                    <td class="val"> <%= overtime %> </td>
                </tr>
                <tr>
                    <th class="label"> Overtime Pay: </th>   
                    <td class="val"> $<%= overtimePay %>  </td>
                </tr>
                <tr>
                    <th class="label"> Gross Pay: </th>   
                    <td class="val"> $<%= grossPay %> </td>
                </tr>
                <tr>
                    <th class="label"> Pre-tax Deductions: </th>   
                    <td class="val"> $<%= preTaxDeduct %> </td>
                </tr>
                <tr>
                    <th class="label"> Pre-tax Pay: </th>   
                    <td class="val"> $<%= taxablePay %> </td>
                </tr>
                <tr>
                    <th class="label"> Tax Amount: </th>   
                    <td class="val"> $<%= taxAmount %> </td>
                </tr>
                <tr>
                    <th class="label"> Post-tax Pay: </th>   
                    <td class="val"> $<%= postTaxPay %> </td>
                </tr>
                <tr>
                    <th class="label"> Post-tax Deductions: </th>   
                    <td class="val"> $<%= postTaxDeduct %>  </td>
                </tr>
                <tr>
                    <th class="label"> Net Pay: </th>   
                    <td class="val"> $<%= netPay %> </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>

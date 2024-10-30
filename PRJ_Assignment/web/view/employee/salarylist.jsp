<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salary List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f0f2f5;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 25px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            h1 {
                color: #1a3353;
                text-align: center;
                margin-bottom: 30px;
                font-size: 28px;
            }

            .search-form {
                text-align: center;
                margin-bottom: 35px;
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
            }

            .search-form input[type="month"] {
                padding: 10px 15px;
                font-size: 16px;
                border: 2px solid #dce0e4;
                border-radius: 6px;
                margin-right: 12px;
                outline: none;
                transition: border-color 0.3s;
            }

            .search-form input[type="month"]:focus {
                border-color: #4a90e2;
            }

            .search-form button {
                padding: 10px 25px;
                font-size: 16px;
                background-color: #4a90e2;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s;
                font-weight: 500;
            }

            .search-form button:hover {
                background-color: #357abd;
                transform: translateY(-1px);
            }

            .search-form button:active {
                transform: translateY(0);
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin-top: 20px;
                border: 1px solid #dce0e4;
                border-radius: 8px;
                overflow: hidden;
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #dce0e4;
                border-right: 1px solid #dce0e4;
            }

            th:last-child, td:last-child {
                border-right: none;
            }

            th {
                background-color: #4a90e2;
                color: white;
                font-weight: 500;
                white-space: nowrap;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:nth-child(even) {
                background-color: #f8f9fa;
            }

            tr:hover {
                background-color: #f0f7ff;
            }

            .no-data {
                text-align: center;
                padding: 30px;
                color: #666;
                background-color: #f8f9fa;
                border-radius: 8px;
                margin-top: 20px;
                font-size: 16px;
            }

            .currency {
                text-align: right;

            }

            @media screen and (max-width: 768px) {
                .container {
                    padding: 15px;
                }

                table {
                    display: block;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                .search-form input[type="month"] {
                    width: 100%;
                    margin-bottom: 10px;
                    margin-right: 0;
                }

                .search-form button {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Salary List</h1>

            <div class="search-form">
                <form action="listsalary" method="POST">
                    <input type="month" name="monthYear" value="${selectedMonth}" required />
                    <button type="submit">Search</button>
                </form>
            </div>

            <c:if test="${not empty salaryList}">
                <table>
                    <thead>
                        <tr>
                            <th>Salary ID</th>
                            <th>Employee ID</th>
                            <th>Month Year</th>
                            <th>Salary</th>
                            <th>Fine</th>
                            <th>Note</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${salaryList}" var="s">
                            <tr>
                                <td>${s.salaryID}</td>
                                <td>${s.emp.id}</td>
                                <td>${s.monthyear}</td>
                                <td class="currency" style="color: green">${String.format("%,d", s.salary.longValue())}vnd</td>
                                <td class="currency" style="color: red">${String.format("%,d", s.fine.longValue())}vnd</td>
                                <td>${s.note}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty salaryList and not empty selectedMonth}">
                <div class="no-data">
                    No salary records found for the selected month.
                </div>
            </c:if>
        </div>
    </body>
</html>
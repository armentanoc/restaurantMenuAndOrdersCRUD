<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List, model.Order, model.MenuItem, model.DAOMenuItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pedidos</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="script/MenuValidator.js"></script>
    <style>
        /* Add your CSS styles here */
        @media only screen and (max-width: 900px) {
            /* Hide columns on smaller devices */
            .menu-table th:nth-child(3),
                .menu-table td:nth-child(3), .menu-table th:nth-child(4), .menu-table td:nth-child(4),
                .menu-table th:nth-child(5), .menu-table td:nth-child(5), .menu-table th:nth-child(6),
                .menu-table td:nth-child(6), .menu-table th:nth-child(7), .menu-table td:nth-child(7) {
                display: none;
            }
        }
    </style>
</head>
<body>
    <header id="container-menu">
        <p class="menu-title">Villa Eleganza</p>
    </header>
    <main>
        <div id="box-main">
            <h2 class="menu-heading">Pedidos</h2>
            <table border="1" class="menu-table">
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Entrada</th>
                    <th>Prato Principal</th>
                    <th>Sobremesa</th>
                    <th>Status</th>
                    <th>Criado em</th>
                    <th>Atualizado em</th>
                    <th>Excluir</th>
                    <th>Atualizar Status</th>
                </tr>
                <% List<Order> orders = (List<Order>) request.getAttribute("orders");
                DAOMenuItem daoMenuItem = new DAOMenuItem();
                for (Order order : orders) { %>
                <tr>
                    <td><%=order.getId()%></td>
                    <td><%=order.getCustomerName()%></td>
                    <td><%=daoMenuItem.getMenuItemNameById(order.getEntradaId())%></td>
                    <td><%=daoMenuItem.getMenuItemNameById(order.getPratoPrincipalId())%></td>
                    <td><%=daoMenuItem.getMenuItemNameById(order.getSobremesaId())%></td>
                    <td><%=order.getStatus()%></td>
                    <td><%=formatTimestamp(order.getCreatedAt())%></td>
                    <td><%=formatTimestamp(order.getUpdatedAt())%></td>
                    <td>
                        <form action="Controller" method="post" onsubmit="return confirmDelete(event)">
                            <input type="hidden" name="action" value="deleteOrder">
                            <input type="hidden" name="idToDelete" value="<%=order.getId()%>">
                            <button type="submit" class="delete-button">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="updateOrderStatus">
                            <input type="hidden" name="idToUpdate" value="<%=order.getId()%>">
                            <select name="status" required>
                                <option value="" disabled <%=selected("", order.getStatus())%>>Selecione status</option>
                                <option value="pendente" <%=selected("pendente", order.getStatus())%>>pendente</option>
                                <option value="cancelado" <%=selected("cancelado", order.getStatus())%>>cancelado</option>
                                <option value="pronto" <%=selected("pronto", order.getStatus())%>>pronto</option>
                                <option value="entregue" <%=selected("entregue", order.getStatus())%>>entregue</option>
                            </select>
                            <button type="submit" class="edit-button">Atualizar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
            <table>
                <tr>
                    <td>
                        <button onclick="redirectToHome()" class="back-button botao">Home</button>
                    </td>
                </tr>
            </table>
        </div>
    </main>
</body>
</html>

<%! // Helper method to format timestamp with date and time
    private String formatTimestamp(java.sql.Timestamp timestamp) {
        if (timestamp == null) {
            return ""; // Handle null timestamps as needed
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm");
        return sdf.format(timestamp);
    }

    // Helper method to simplify selected attribute in the dropdown
    private String selected(String expected, String actual) {
        return expected.equals(actual) ? "selected" : "";
    }
%>

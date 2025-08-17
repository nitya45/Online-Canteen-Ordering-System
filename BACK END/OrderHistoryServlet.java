package servlet;

import dao.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class OrderHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userEmail = (String) session.getAttribute("email");
        String userType = (String) session.getAttribute("userType");

        // If user is guest, show message
        if ("guest".equalsIgnoreCase(userType)) {
            request.setAttribute("guestMessage", "First order something then see your last orders.");
            RequestDispatcher rd = request.getRequestDispatcher("order_history.jsp");
            rd.forward(request, response);
            return;
        }

        List<Map<String, String>> orderList = new ArrayList<>();
        Map<String, String> lastOrder = null;

        try {
            Connection con = DBConnection.getConnection();  // ✅ Use your DBConnection class

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM orders WHERE email = ? ORDER BY orderTime DESC"
            );
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> order = new HashMap<>();
                order.put("currentState", rs.getString("order_status"));
                order.put("orderId", rs.getString("id"));
                order.put("orderTime", rs.getString("order_time"));
                order.put("itemList", rs.getString("food_items"));
                order.put("amount", rs.getString("total_amount"));

                if (lastOrder == null) {
                    lastOrder = new HashMap<>(order); // First one is last order
                }

                orderList.add(order);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("lastOrder", lastOrder);
        request.setAttribute("orderList", orderList);
        RequestDispatcher rd = request.getRequestDispatcher("order_history.jsp");
        rd.forward(request, response);
    }
}

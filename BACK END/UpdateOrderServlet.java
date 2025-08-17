
package servlet;

import dao.DBConnection;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet(name = "UpdateOrderServlet", urlPatterns = {"/UpdateOrderServlet"})
public class UpdateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = request.getParameter("status");

        try (Connection con = DBConnection.getConnection()) {
            // Fetch user details before updating
            PreparedStatement psFetch = con.prepareStatement("SELECT username, email, table_no, food_items, total_amount FROM orders WHERE id = ?");
            psFetch.setInt(1, orderId);
            ResultSet rs = psFetch.executeQuery();

            String username = "", email = "", tableNo = "", foodItems = "";
            double total = 0;

            if (rs.next()) {
                username = rs.getString("username");
                email = rs.getString("email");
                tableNo = rs.getString("table_no");
                foodItems = rs.getString("food_items");
                total = rs.getDouble("total_amount");
            }
            rs.close();
            psFetch.close();

            // Update order status
            PreparedStatement psUpdate = con.prepareStatement("UPDATE orders SET order_status = ? WHERE id = ?");
            psUpdate.setString(1, newStatus);
            psUpdate.setInt(2, orderId);
            int updated = psUpdate.executeUpdate();
            psUpdate.close();

            if (updated > 0 && email != null && !email.isEmpty()) {
                sendStatusUpdateEmail(getServletContext(), email, username, tableNo, String.valueOf(orderId), foodItems, total, newStatus);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin_order_status.jsp");
    }

    private void sendStatusUpdateEmail(ServletContext context, String recipientEmail, String username, String tableNo, String orderId, String orderItems, double total, String status) {
        String smtpHost = "smtp.gmail.com";
        String smtpPort = "587";
        final String smtpUser = "pr7509645@gmail.com";
        final String smtpPass = "zxfk vqjl tnnz qtmv";

        String subject = "Order Status Updated - Online Canteen";

       String statusMessage;
switch (status.toLowerCase()) {
    case "preparing":
        statusMessage = "Your order is being prepared.";
        break;
    case "ready":
        statusMessage = "Your order is ready for pickup.";
        break;
    case "delivered":
        statusMessage = "Your order has been delivered.";
        break;
    default:
        statusMessage = "Order status updated.";
        break;
}

        String messageBody = "Hi " + username + ",\n\n" +
                "Your order status has been updated.\n\n" +
                "Order ID: " + orderId + "\n" +
                "Table No: " + tableNo + "\n" +
                "Items: " + orderItems + "\n" +
                "Total Amount: Rs. " + total + "\n\n" +
                "Status: " + statusMessage + "\n\n" +
                "Regards,\nOnline Canteen System";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);

        Session mailSession = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(smtpUser, smtpPass);
            }
        });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(smtpUser));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setText(messageBody);

            MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
            mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
            mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
            mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
            mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
            CommandMap.setDefaultCommandMap(mc);

            Transport.send(message);
            System.out.println("Status update email sent to: " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Failed to send email: " + e.getMessage());
        }
    }
}


//
//package servlet;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.io.IOException;
//import java.util.*;
//import servlet.PlaceOrderServlet.OrderLine;
//
//@WebServlet(name = "UpdateOrderServlet", urlPatterns = {"/UpdateOrderServlet"})
//public class UpdateOrderServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession();
//        List<OrderLine> orderLines = (List<OrderLine>) session.getAttribute("orderLines");
//        Double totalAmount = (Double) session.getAttribute("orderTotal");
//
//        if (orderLines == null || orderLines.isEmpty()) {
//            response.sendRedirect("menu.jsp?error=emptyOrder");
//            return;
//        }
//
//        // Get item names to remove
//        String[] removeItemNames = request.getParameterValues("removeItemIds");
//
//        if (removeItemNames != null && removeItemNames.length > 0) {
//            Set<String> removeSet = new HashSet<>(Arrays.asList(removeItemNames));
//            double newTotal = 0;
//            List<OrderLine> updatedLines = new ArrayList<>();
//
//            for (OrderLine line : orderLines) {
//                 System.out.println("removed item"+line.name);
//                
//                if (!removeSet.contains(line.name)) {
//                     System.out.println("removed item"+line.name);
//                      System.out.println("removed item"+line.id);
//                    updatedLines.add(line);
//                    newTotal += line.price;
//                }
//            }
//          System.out.println("");
//            // Update session
//            session.setAttribute("orderLines", updatedLines);
//            session.setAttribute("orderTotal", newTotal);
//        }
//
//        response.sendRedirect("payment.jsp");
//    }
//}


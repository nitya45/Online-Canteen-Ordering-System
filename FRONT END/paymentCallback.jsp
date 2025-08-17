<%-- 
    Document   : paymentCallback
    Created on : May 11, 2025, 1:53:12 PM
    Author     : prince rajput
--%>

<%@ page import="java.io.*, javax.servlet.*" %>
<%
    String paymentId = request.getParameter("razorpay_payment_id");
    if (paymentId == null || paymentId.isEmpty()) {
        response.sendRedirect("payment.jsp?error=paymentMissing");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Payment...</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .spinner {
            border: 4px solid rgba(255, 255, 255, 0.1);
            border-top: 4px solid #4ade80;
            border-radius: 50%;
            width: 48px;
            height: 48px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body class="bg-gray-900 text-white min-h-screen flex items-center justify-center">
    <form id="forwardForm" action="Prince" method="POST">
        <input type="hidden" name="razorpay_payment_id" value="<%= paymentId %>">
    </form>

    <div class="text-center">
        <div class="spinner mx-auto mb-4"></div>
        <h2 class="text-xl font-semibold text-green-400 animate-pulse">Processing your payment...</h2>
        <p class="text-gray-300 mt-2">Please wait while we redirect you to the confirmation page.</p>
    </div>

    <script>
        setTimeout(() => {
            document.getElementById('forwardForm').submit();
        }, 1500);
    </script>
</body>
</html>

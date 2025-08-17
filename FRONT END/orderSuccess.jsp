<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, servlet.PlaceOrderServlet.OrderLine" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-yellow-50 to-orange-100 min-h-screen flex flex-col">
    <%@ include file="navbar.jsp" %>

    <div class="container mx-auto mt-12 px-4 py-8 bg-white rounded-2xl shadow-xl shadow-orange-200 w-11/12 md:w-3/4 lg:w-2/3">
        <h1 class="text-3xl font-bold text-green-600 text-center mb-6">Order Placed Successfully</h1>

        <div class="order-details space-y-4">
            <h2 class="text-xl font-semibold text-gray-800 border-b pb-2">Order Details:</h2>

            <%
                String orderId = (String) session.getAttribute("orderId");
                String username = (String) session.getAttribute("username");
                String tableNo = (String) session.getAttribute("tableNo");
                Double orderTotal = (Double) session.getAttribute("orderTotal");
                List<OrderLine> orderLines = (List<OrderLine>) session.getAttribute("orderLines");
            %>

            <div class="text-lg">
                <p><span class="font-medium text-gray-700">Order ID:</span> <%= orderId %></p>
                <p><span class="font-medium text-gray-700">Username:</span> <%= username %></p>
                <p><span class="font-medium text-gray-700">Table No:</span> <%= tableNo %></p>
                <p><span class="font-medium text-gray-700">Total Amount:</span> <span class="text-green-600 font-semibold">₹<%= orderTotal %></span></p>
            </div>

            <div>
                <h3 class="text-lg font-semibold text-orange-700 mb-2">Ordered Items:</h3>
                <ul class="list-disc list-inside space-y-1">
                    <%
                        if (orderLines != null) {
                            for (OrderLine line : orderLines) {
                    %>
                        <li class="hover:scale-105 transition-transform duration-300 ease-in-out"><%= line.getName() %> - ₹<%= line.getPrice() %></li>
                    <%
                            }
                        }
                    %>
                </ul>
            </div>
        </div>

        <div class="sms-notification mt-8 text-center text-green-700">
            <p class="mb-2">Your order has been successfully placed, and a confirmation mail has been sent to your email.</p>
            <p>
                <a href="menu.jsp" class="inline-block bg-orange-400 text-white px-4 py-2 rounded-full shadow hover:shadow-lg hover:scale-105 transition-transform duration-300">Back to Menu</a>
                <a href="order_history.jsp" class="inline-block bg-green-500 text-white px-4 py-2 rounded-full shadow hover:shadow-lg hover:scale-105 transition-transform duration-300 ml-4">View Order History</a>
            </p>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>


<%--
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, servlet.PlaceOrderServlet.OrderLine" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Order Success</title>
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- AOS (Animate on Scroll) -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <!-- Canvas Confetti -->
  <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
  <script>AOS.init({ duration: 600, once: true });</script>
</head>
<body class="bg-gray-900 flex items-center justify-center min-h-screen overflow-hidden">
  <canvas id="confettiCanvas" class="fixed inset-0 pointer-events-none"></canvas>

  <div id="successCard" class="bg-white bg-opacity-20 backdrop-blur-lg p-8 rounded-3xl shadow-2xl max-w-lg mx-auto transform transition-transform duration-500 hover:scale-105" data-aos="zoom-in">
    <h1 class="text-4xl font-extrabold text-green-400 mb-4">✅ Order Placed Successfully!</h1>
    <div class="grid grid-cols-1 gap-4 mb-6">
      <% String orderId = (String) session.getAttribute("orderId"); %>
      <% String username = (String) session.getAttribute("username"); %>
      <% String tableNo = (String) session.getAttribute("tableNo"); %>
      <% Double orderTotal = (Double) session.getAttribute("orderTotal"); %>
      <div class="flex justify-between">
        <span class="font-medium text-gray-100">Order ID:</span>
        <span class="font-semibold text-white"><%=orderId%></span>
      </div>
      <div class="flex justify-between">
        <span class="font-medium text-gray-100">Username:</span>
        <span class="font-semibold text-white"><%=username%></span>
      </div>
      <div class="flex justify-between">
        <span class="font-medium text-gray-100">Table No:</span>
        <span class="font-semibold text-white"><%=tableNo%></span>
      </div>
      <div class="flex justify-between">
        <span class="font-medium text-gray-100">Total Amount:</span>
        <span class="font-semibold text-white">₹<%=orderTotal%></span>
      </div>
    </div>

    <h2 class="text-2xl font-bold text-white mb-2">Ordered Items:</h2>
    <ul class="space-y-1 mb-6 max-h-48 overflow-y-auto">
      <% List<OrderLine> orderLines = (List<OrderLine>) session.getAttribute("orderLines");
         if (orderLines != null) {
           for (OrderLine line : orderLines) { %>
             <li class="flex justify-between bg-gray-800 bg-opacity-50 p-3 rounded-lg transform transition-transform duration-300 hover:scale-[1.02]">
               <span class="text-gray-200"><%=line.getName()%></span>
               <span class="text-green-300">₹<%=line.getPrice()%></span>
             </li>
      <%   }
         } %>
    </ul>

    <div class="text-center">
      <p class="text-green-300 mb-4">A confirmation SMS has been sent to your mobile number 📱</p>
      <a id="backLink" href="menu.jsp" class="inline-block bg-green-400 text-gray-900 font-bold py-2 px-6 rounded-full shadow-xl transform transition-transform duration-300 hover:rotate-3 hover:scale-105">
        Back to Menu (<span id="countdown">5</span>s)
      </a>
    </div>
  </div>

  <!-- Scripts -->
  <script>
    // Confetti burst
    const confettiCanvas = document.getElementById('confettiCanvas');
    const myConfetti = confetti.create(confettiCanvas, { resize: true });
    myConfetti({ particleCount: 100, spread: 160 });

    // Countdown redirect
    let timeLeft = 5;
    const countdownEl = document.getElementById('countdown');
    const backLink = document.getElementById('backLink');
    const timer = setInterval(() => {
      timeLeft--;
      countdownEl.textContent = timeLeft;
      if (timeLeft === 0) {
        clearInterval(timer);
        backLink.click();
      }
    }, 1000);
  </script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
--%>
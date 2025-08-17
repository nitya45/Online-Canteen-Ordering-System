
<%--

<%@ page import="java.util.*, servlet.PlaceOrderServlet.OrderLine" %>
<%@ page session="true" %>
<%
    List<OrderLine> orderLines = (List<OrderLine>) session.getAttribute("orderLines");
    String username = (String) session.getAttribute("username");
    String tableNo = (String) session.getAttribute("tableNo");
    Double totalAmount = (Double) session.getAttribute("orderTotal");
    String email = (String) session.getAttribute("email");
    String mobile = (String) session.getAttribute("mobile");

    if (orderLines == null || orderLines.isEmpty()) {
        response.sendRedirect("menu.jsp?error=emptyOrder");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Secure Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f8fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            margin-top: 40px;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 700px;
        }

        h2 {
            margin-top: 0;
            color: #333;
        }

        .summary {
            font-size: 16px;
            margin-bottom: 20px;
            color: #555;
        }

        .summary h3 {
            margin: 5px 0;
            color: #000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
            color: #222;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 10px;
        }

        #rzp-button1 {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        #rzp-button1:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Payment Summary</h2>

    <div class="summary">
        <strong>Name:</strong> <h3><%= username %></h3>
        <strong>Table No:</strong> <h3><%= tableNo %></h3>
    </div>

    <table>
        <tr>
            <th>Item</th>
            <th>Price (Rs.)</th>
        </tr>
        <% for (OrderLine line : orderLines) { %>
        <tr>
            <td><%= line.name %></td>
            <td><%= line.price %></td>
        </tr>
        <% } %>
    </table>

    <div class="total">Total: Ra. <%= totalAmount %></div>

    
    <button id="rzp-button1">Proceed to Secure Payment</button>
</div>

<script>
    var options = {
        "key": "rzp_test_8eJ3Bw4Wj5FYAd", // Replace with your Razorpay key
        "amount": <%= (int)(totalAmount * 100) %>,
        "currency": "INR",
        "name": "OnlineCanteenOrderingSystem",
        "description": "Order Payment",
        "handler": function (response) {
            // Redirect to JSP that forwards to PaymentServlet
            window.location.href = "paymentCallback.jsp?razorpay_payment_id=" + response.razorpay_payment_id;
        },
        "prefill": {
            "name": "<%= username %>",
            "email": "<%= email %>",
            "contact": "<%= mobile %>"
        },
        "theme": {
            "color": "#4CAF50"
        }
    };

    var rzp1 = new Razorpay(options);
    document.getElementById('rzp-button1').onclick = function (e) {
        rzp1.open();
        e.preventDefault();
    };
</script>

</body>
</html>
--%>

<%@ page import="java.util.*, servlet.PlaceOrderServlet.OrderLine" %>
<%@ page session="true" %>
<%
    List<OrderLine> orderLines = (List<OrderLine>) session.getAttribute("orderLines");
    String username = (String) session.getAttribute("username");
    String tableNo = (String) session.getAttribute("tableNo");
    Double totalAmount = (Double) session.getAttribute("orderTotal");
    String email = (String) session.getAttribute("email");
    String mobile = (String) session.getAttribute("mobile");

    if (orderLines == null || orderLines.isEmpty()) {
        response.sendRedirect("menu.jsp?error=emptyOrder");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Payment Summary</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    .glass-card {
      background: rgba(255, 255, 255, 0.05);
      border-radius: 20px;
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      border: 1px solid rgba(255, 255, 255, 0.18);
      transition: transform 0.3s ease;
    }
    .glass-card:hover {
      transform: scale(1.02);
    }
  </style>
</head>
<body class="bg-gray-900 text-white min-h-screen flex flex-col items-center pt-16 px-4">
  <%@ include file="navbar.jsp" %>
  <div class="glass-card p-8 w-full max-w-xl">
    <h2 class="text-3xl font-bold text-center text-green-400 mb-6">Payment Summary</h2>

    <div class="mb-4 space-y-2 text-sm">
      <div><strong>Name:</strong> <%= username %></div>
      <div><strong>Table No:</strong> <%= tableNo %></div>
    </div>

    <div class="max-h-64 overflow-y-auto mb-6">
      <% for (OrderLine line : orderLines) { %>
        <div class="bg-gray-700/70 rounded-md p-3 mb-2 flex justify-between hover:bg-gray-600 transition">
          <span><%= line.getName() %></span>
          <span>Rs <%= line.getPrice() %></span>
        </div>
      <% } %>
    </div>

    <div class="text-right text-xl font-bold mb-6">
      Total: Rs <%= totalAmount %>
    </div>

    <button id="rzp-button1"
            class="w-full bg-gradient-to-r from-green-400 via-green-500 to-green-600 hover:from-green-500 hover:to-green-700 text-black font-semibold py-3 rounded-md shadow-md transition-all duration-300">
      Proceed to Secure Payment
    </button>
  </div>

  <!-- Decorative Element -->
  <div class="mt-12 text-green-300 text-sm animate-pulse">
    Hungry? We're preparing your delicious meal!
  </div>

  <!-- Razorpay -->
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
  <script>
    var options = {
      "key": "rzp_test_8eJ3Bw4Wj5FYAd",
      "amount": <%= (int)(totalAmount * 100) %>,
      "currency": "INR",
      "name": "Online Canteen Ordering System",
      "description": "Order Payment",
      "handler": function (response) {
        window.location.href = "paymentCallback.jsp?razorpay_payment_id=" + response.razorpay_payment_id;
      },
      "prefill": {
        "name": "<%= username %>",
        "email": "<%= email %>",
        "contact": "<%= mobile %>"
      },
      "theme": {
        "color": "#10b981"
      }
    };
    var rzp1 = new Razorpay(options);
    document.getElementById('rzp-button1').onclick = function (e) {
      rzp1.open();
      e.preventDefault();
    };
  </script>
  <%@ include file="footer.jsp" %>
</body>
</html>

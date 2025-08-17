<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(145deg, #f3f4f6, #e2e8f0);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h3 {
            font-weight: 600;
            color: #333;
        }
        .form-label {
            font-weight: 500;
        }
        .btn-success {
            background-color: #198754;
            border: none;
        }
        .btn-success:hover {
            background-color: #157347;
        }
    </style>
    <script>
        function showFields() {
            const userType = document.querySelector('input[name="userType"]:checked')?.value;
            ['student', 'teacher', 'other'].forEach(type => {
                const section = document.getElementById(type + "Fields");
                if (section) section.style.display = (type === userType) ? 'block' : 'none';
            });
        }

        function beforeSubmit(e) {
            const selectedType = document.querySelector('input[name="userType"]:checked')?.value;

            if (!selectedType) {
                alert("Please select a user type.");
                e.preventDefault();
                return;
            }

            ['student', 'teacher', 'other'].forEach(type => {
                if (type !== selectedType) {
                    const section = document.getElementById(type + 'Fields');
                    if (section) {
                        const inputs = section.querySelectorAll('input');
                        inputs.forEach(input => input.remove());
                    }
                }
            });
        }

        window.onload = function() {
            showFields();
            document.getElementById("userForm").addEventListener("submit", beforeSubmit);
        };
    </script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container mt-5">
    <div class="form-container">
        <h3 class="text-center mb-4">Enter Your Details</h3>
        <form id="userForm" action="PlaceOrderServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Select User Type:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="userType" value="student" onclick="showFields()" required>
                    <label class="form-check-label">Student</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="userType" value="teacher" onclick="showFields()">
                    <label class="form-check-label">Teacher</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="userType" value="other" onclick="showFields()">
                    <label class="form-check-label">Other</label>
                </div>
            </div>

            <!-- Student fields -->
            <div id="studentFields" style="display: none;">
                <div class="mb-3">
                    <label class="form-label">Enrollment No.</label>
                    <input type="text" name="rollno" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile No.</label>
                    <input type="text" name="mobile" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email ID</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">College Name</label>
                    <input type="text" name="college" class="form-control">
                </div>
            </div>

            <!-- Teacher fields -->
            <div id="teacherFields" style="display: none;">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile No.</label>
                    <input type="text" name="mobile" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email ID</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">College Name</label>
                    <input type="text" name="college" class="form-control">
                </div>
            </div>

            <!-- Other fields -->
            <div id="otherFields" style="display: none;">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile No.</label>
                    <input type="text" name="mobile" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email ID</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Purpose (optional)</label>
                    <input type="text" name="purpose" class="form-control">
                </div>
            </div>

            <!-- Hidden Fields -->
            <input type="hidden" name="tableNo" value="<%=request.getParameter("tableNo")%>"/>
            <% 
                String[] itemIds = request.getParameterValues("itemIds");
                if(itemIds != null){
                    for(String id: itemIds){
            %>
                <input type="hidden" name="itemIds" value="<%=id%>"/>
            <% 
                    }
                }
            %>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-success btn-lg">Submit & Continue</button>
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>




<%--




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <script>
        function showFields() {
            const userType = document.querySelector('input[name="userType"]:checked')?.value;
            ['student', 'teacher', 'other'].forEach(type => {
                const section = document.getElementById(type + "Fields");
                if (section) section.style.display = (type === userType) ? 'block' : 'none';
            });
        }

        function beforeSubmit(e) {
            const selectedType = document.querySelector('input[name="userType"]:checked')?.value;

            if (!selectedType) {
                alert("Please select a user type.");
                e.preventDefault();
                return;
            }

            ['student', 'teacher', 'other'].forEach(type => {
                if (type !== selectedType) {
                    const section = document.getElementById(type + 'Fields');
                    if (section) {
                        // Remove all input fields in the unselected section
                        const inputs = section.querySelectorAll('input');
                        inputs.forEach(input => input.remove());
                    }
                }
            });
        }

        window.onload = function() {
            showFields();
            document.getElementById("userForm").addEventListener("submit", beforeSubmit);
        };
    </script>
</head>
<body class="bg-light">
    <%@ include file="navbar.jsp" %>
<div class="container mt-5">
    <div class="bg-white p-5 rounded shadow">
        <h3 class="mb-4 text-center">Enter Your Details</h3>

        <form id="userForm" action="PlaceOrderServlet" method="Post">

            <!-- User type selection -->
            <div class="mb-3">
                <label class="form-label">Select User Type:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="userType" value="student" onclick="showFields()" required>
                    <label class="form-check-label">Student</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="userType" value="teacher" onclick="showFields()">
                    <label class="form-check-label">Teacher</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="userType" value="other" onclick="showFields()">
                    <label class="form-check-label">Other</label>
                </div>
            </div>

            <!-- Student fields -->
            <div id="studentFields" style="display: none;">
                <div class="mb-3">
                    <label>Enrollment No.</label>
                    <input type="text" name="rollno" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Name</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Mobile No.</label>
                    <input type="text" name="mobile" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Email ID</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label>College Name</label>
                    <input type="text" name="college" class="form-control">
                </div>
            </div>

            <!-- Teacher fields -->
            <div id="teacherFields" style="display: none;">
                <div class="mb-3">
                    <label>Name</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Mobile No.</label>
                    <input type="text" name="mobile" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Email ID</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label>College Name</label>
                    <input type="text" name="college" class="form-control">
                </div>
            </div>

            <!-- Other fields -->
            <div id="otherFields" style="display: none;">
                <div class="mb-3">
                    <label>Name</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Mobile No.</label>
                    <input type="text" name="mobile" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Email ID</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Purpose (optional)</label>
                    <input type="text" name="purpose" class="form-control">
                </div>
            </div>

            <!-- Hidden Fields -->
            <input type="hidden" name="tableNo" value="<%=request.getParameter("tableNo")%>"/>
            <% 
                String[] itemIds = request.getParameterValues("itemIds");
                if(itemIds != null){
                    for(String id: itemIds){
            %>
                <input type="hidden" name="itemIds" value="<%=id%>"/>
            <% 
                    }
                }
            %>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-success">Submit & Continue</button>
            </div>
        </form>
    </div>
</div>
            <%@ include file="footer.jsp" %>
</body>
</html>










<%--
<%@ page import="java.sql.*, java.util.*, dao.DBConnection" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Details - FoodEase</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- AOS -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>AOS.init({ duration: 800, once: true });</script>
  <style>
    body { font-family: 'Inter', sans-serif; background-color: #111827; }
    .form-card {
      background: #1f2937;
      border-radius: 0.75rem;
      box-shadow: 0 8px 20px rgba(0,0,0,0.3);
      padding: 2rem;
      color: white;
    }
    .btn-3d {
      background: #fffbea;
      color: #000;
      font-weight: 600;
      padding: 0.5rem 1.5rem;
      border-radius: 0.5rem;
      box-shadow: 0 8px 15px rgba(0,0,0,0.2);
      position: relative;
      overflow: hidden;
      transition: transform 0.3s ease;
    }
    .btn-3d:hover {
      transform: translateY(-3px) scale(1.05);
    }
    .hidden { display: none; }
  </style>
</head>
<body>
  <%@ include file="navbar.jsp" %>

  <main class="pt-24 pb-16 container mx-auto px-4">
    <div class="form-card max-w-xl mx-auto" data-aos="fade-up">
      <h2 class="text-3xl font-bold text-center mb-6">Enter Your Details</h2>
      <form id="userForm" action="PlaceOrderServlet" method="post">
        <input type="hidden" name="tableNo" value="<%=request.getParameter("tableNo")%>">
        <% String[] selectedItems = request.getParameterValues("itemIds");
           if(selectedItems != null){
             for(String itemId : selectedItems){ %>
               <input type="hidden" name="itemIds" value="<%=itemId%>">
        <%   }
           } %>

        <div class="mb-4">
          <label class="block mb-1 font-medium">User Type</label>
          <div class="space-x-4">
            <label><input type="radio" name="userType" value="student" onclick="showFields()" required> Student</label>
            <label><input type="radio" name="userType" value="teacher" onclick="showFields()"> Teacher</label>
            <label><input type="radio" name="userType" value="other" onclick="showFields()"> Other</label>
          </div>
        </div>

        <div id="studentFields" class="space-y-4 hidden">
          <input type="text" name="rollno" placeholder="Enrollment No." class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="userName" placeholder="Name" class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="mobile" placeholder="Mobile No." class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="email" name="email" placeholder="Email ID" class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="college" placeholder="College Name" class="w-full p-2 rounded-md bg-gray-800 text-white">
        </div>

        <div id="teacherFields" class="space-y-4 hidden">
          <input type="text" name="userName" placeholder="Name" class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="mobile" placeholder="Mobile No." class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="email" name="email" placeholder="Email ID" class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="college" placeholder="College Name" class="w-full p-2 rounded-md bg-gray-800 text-white">
        </div>

        <div id="otherFields" class="space-y-4 hidden">
          <input type="text" name="userName" placeholder="Name" class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="mobile" placeholder="Mobile No." class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="email" name="email" placeholder="Email ID" class="w-full p-2 rounded-md bg-gray-800 text-white">
          <input type="text" name="purpose" placeholder="Purpose (optional)" class="w-full p-2 rounded-md bg-gray-800 text-white">
        </div>

        <div class="text-center">
          <button type="submit" class="btn-3d">Confirm Order</button>
        </div>
      </form>
    </div>
  </main>

  <script>
    function showFields() {
      const userType = document.querySelector('input[name="userType"]:checked')?.value;
      ['student', 'teacher', 'other'].forEach(type => {
        const section = document.getElementById(type + 'Fields');
        if (section) section.classList.add('hidden');
      });
      if (userType) {
        const section = document.getElementById(userType + 'Fields');
        if (section) section.classList.remove('hidden');
      }
    }

    document.getElementById("userForm").addEventListener("submit", function(e) {
      const selected = document.querySelector('input[name="userType"]:checked')?.value;
      if (!selected) {
        e.preventDefault();
        alert("Please select a user type.");
        return;
      }
     ['student', 'teacher', 'other'].forEach(type => {
        const section = document.getElementById(type + 'Fields');
        if (type !== selected && section) {
          section.querySelectorAll("input").forEach(input => input.disabled = true);
        } else if (type === selected && section) {
          section.querySelectorAll("input").forEach(input => input.disabled = false);
        }
      });
    });
  </script>

  <%@ include file="footer.jsp" %>
</body>
</html>
--%>
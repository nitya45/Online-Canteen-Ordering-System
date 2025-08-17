
<%--

<%@ page import="java.sql.*, java.util.*, dao.DBConnection" %>
<%
    String tableNo = request.getParameter("tableNo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #fff;
        }

        .category-btn.active {
            background-color: #1e3c72;
            color: white;
        }

        .category-btn {
            color: #fff;
            border-color: #2a5298;
            transition: all 0.3s ease;
        }

        .category-btn:hover {
            background-color: #2a5298;
            color: #fff;
        }

        .card-img-placeholder {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 200px;
            background-color: #2a2a2a;
            color: #ccc;
            font-style: italic;
        }

        .sticky-header {
            position: sticky;
            top: 60px;
            z-index: 1040;
            background: #121212;
            padding: 1rem 0;
        }

        .custom-scrollbar {
            overflow-x: auto;
            white-space: nowrap;
        }

        .custom-scrollbar .btn {
            display: inline-block;
        }

        .form-check-input:checked {
            background-color: #1e3c72;
            border-color: #2a5298;
        }

        .form-check-label {
            color: #ccc;
            transition: all 0.2s ease-in-out;
        }

        .form-check-input:checked + .form-check-label {
            color: #fff;
            font-weight: 500;
        }

        .btn-continue {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #fff;
            border: none;
            padding: 0.6rem 1.5rem;
            font-size: 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: sticky;
            bottom: 20px;
            z-index: 1050;
        }

        .btn-continue:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #2a5298, #1e3c72);
        }

        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .form-check-label:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container mt-5" style="padding-top: 80px;">
    <h2 class="text-center mb-4">Select Table & Menu Items</h2>
    <form action="userDetails.jsp" method="post">

        <!-- Sticky Section: Table Selector + Search + Categories -->
        <div class="sticky-header">
            <div class="row justify-content-center align-items-center mb-3">
                <label for="tableNo" class="col-sm-2 col-form-label text-end">Table No:</label>
                <div class="col-sm-2">
                    <select id="tableNo" name="tableNo" class="form-select" required>
                        <option value="" disabled <%= tableNo == null ? "selected" : "" %>>Choose?</option>
                        <% for (int i = 1; i <= 7; i++) { %>
                        <option value="<%= i %>" <%= String.valueOf(i).equals(tableNo) ? "selected" : "" %>>
                            <%= i %>
                        </option>
                        <% } %>
                    </select>
                </div>
<!--                <div class="col-md-4">
                    <input type="text" id="searchInput" class="form-control" placeholder="Search by name or category..." onkeyup="searchMenu()">
                </div>-->
            </div>

            <!-- Category Buttons -->
            <div class="custom-scrollbar text-center pb-2">
                <div id="categoryButtons">
                    <% 
                        Set<String> categories = new LinkedHashSet<>();
                        try (Connection conn = DBConnection.getConnection();
                             Statement stmt = conn.createStatement();
                             ResultSet rs = stmt.executeQuery("SELECT DISTINCT type_of_food FROM menu_items")) {
                            while (rs.next()) {
                                categories.add(rs.getString("type_of_food"));
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        for (String category : categories) {
                    %>
                        <button type="button" class="btn btn-outline-light m-1 category-btn" onclick="filterCategory('<%= category %>')">
                            <%= category %>
                        </button>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Menu Items -->
        <div class="row" id="menuContainer">
            <%
                List<Map<String, String>> menuItems = new ArrayList<>();
                try (Connection conn = DBConnection.getConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM menu_items")) {
                    while (rs.next()) {
                        Map<String, String> item = new HashMap<>();
                        item.put("id", String.valueOf(rs.getInt("id")));
                        item.put("name", rs.getString("name"));
                        item.put("desc", rs.getString("description"));
                        item.put("price", String.valueOf(rs.getDouble("price")));
                        item.put("type", rs.getString("type_of_food"));
                        item.put("image", rs.getString("image_path"));
                        menuItems.add(item);
                    }

                    for (Map<String, String> item : menuItems) {
            %>
            <div class="col-md-4 mb-3 menu-item" data-type="<%= item.get("type") %>" data-name="<%= item.get("name").toLowerCase() %>">
                <div class="card h-100 shadow-sm bg-dark text-white">
                    <% if (item.get("image") != null && !item.get("image").trim().isEmpty()) { %>
                        <img src="<%= item.get("image") %>" class="card-img-top" alt="<%= item.get("name") %>" style="height: 200px; object-fit: cover;">
                    <% } else { %>
                        <div class="card-img-placeholder">Food image is not present</div>
                    <% } %>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= item.get("name") %></h5>
                        <p class="card-text flex-grow-1"><%= item.get("desc") %></p>
                        <p class="mb-2"><strong>Rs <%= item.get("price") %></strong></p>
                        <div class="form-check mt-auto">
                            <input class="form-check-input" type="checkbox" name="itemIds" value="<%= item.get("id") %>" id="item<%= item.get("id") %>">
                            <label class="form-check-label" for="item<%= item.get("id") %>">Add to order</label>
                        </div>
                    </div>
                </div>
            </div>
            <%  }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>

         <!-- Submit Button -->
        <!-- Font Awesome CDN for icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<div class="fixed bottom-5 left-1/2 transform -translate-x-1/2 z-50 w-full px-4 sm:px-0 sm:w-auto">
  <button type="submit"
    class="flex items-center justify-center gap-2 bg-white text-black px-6 py-3 font-semibold rounded-full shadow-2xl hover:shadow-[0_10px_30px_rgba(0,0,0,0.4)] hover:-translate-y-1 hover:scale-105 transition-transform duration-300 ease-in-out animate-bounce text-lg">
    <span>Place Order</span>
    <i class="fas fa-arrow-right text-lg"></i>
  </button>
</div>

    
  
        
    </form>
</div>
<%@ include file="footer.jsp" %>

<!-- Scripts -->
<script>
    function filterCategory(category) {
        const items = Array.from(document.querySelectorAll('.menu-item'));
        items.forEach(item => {
            item.style.display = item.dataset.type === category ? 'block' : 'none';
        });

        document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));
        [...document.querySelectorAll('.category-btn')].find(btn => btn.textContent.trim() === category)?.classList.add('active');
        document.getElementById('searchInput').value = '';
    }

    function searchMenu() {
        const query = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.menu-item');

        items.forEach(item => {
            const name = item.dataset.name;
            const type = item.dataset.type.toLowerCase();
            item.style.display = (name.includes(query) || type.includes(query)) ? 'block' : 'none';
        });

        document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));
    }
</script>
</body>
</html>

--%><%@ page import="java.sql.*, java.util.*, dao.DBConnection, javax.servlet.http.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menu - Foodie Canteen</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- AOS -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    function filterCategory(cat) {
      document.querySelectorAll('#menuContainer > div').forEach(card => {
        card.style.display = (cat === 'all' || card.dataset.type === cat) ? 'block' : 'none';
      });
      document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active-btn'));
      document.querySelectorAll('.category-btn').forEach(btn => {
        if (btn.textContent.trim().toLowerCase() === cat) btn.classList.add('active-btn');
      });
    }

    // Stop button above footer
    document.addEventListener('scroll', () => {
      const btn = document.getElementById('btnContainer');
      const footer = document.querySelector('footer');
      const footerRect = footer.getBoundingClientRect();
      const windowHeight = window.innerHeight;
      if (footerRect.top < windowHeight) {
        // Footer in view: move button above footer
        const overlap = windowHeight - footerRect.top;
        btn.style.bottom = `${overlap + 20}px`;
      } else {
        // Normal position
        btn.style.bottom = '24px';
      }
    });
  </script>
  <style>
  body { font-family: 'Inter', sans-serif; background-color: #111827; }

  /* 3D Place Order Button */
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
  .btn-3d::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 30%;
    height: 100%;
    background: rgba(255,255,255,0.6);
    transform: skewX(-20deg);
    transition: left 0.5s ease-in-out;
  }
  .btn-3d:hover::before {
    left: 120%;
  }
  .btn-3d:hover {
    transform: translateY(-3px) scale(1.05);
  }

  /* 3D Cards */
  .card-3d {
    background: #1f2937;
    border-radius: 0.75rem;
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    transition: transform 0.5s ease;
  }
  .card-3d:hover {
    transform: perspective(800px) rotateX(5deg) rotateY(-5deg) scale(1.02);
  }

  /* Backdrop Blur Utility */
  .backdrop-blur {
    backdrop-filter: blur(10px);
  }

  /* Active Category Button */
  .active-btn {
    background: #6366f1;
    color: #fff;
    border-color: #6366f1;
  }
</style>
</head>

<%
    // Step 1: Read table number from URL (e.g., menu.jsp?tableNo=4)
    String qrTableNo = request.getParameter("tableNo");
    if (qrTableNo != null) {
        session.setAttribute("tableNo", qrTableNo);
    }
    String currentTableNo = (String) session.getAttribute("tableNo");
%>
<body class="relative">
  <%@ include file="navbar.jsp" %>

  <main class="pt-24 pb-16 container mx-auto px-4">
    <h1 class="text-4xl text-white font-bold text-center mb-8" data-aos="fade-down">Our Delicious Menu</h1>

    <form action="userDetails.jsp" method="post">
      <!-- Table Selector & Categories -->
      <div class="sticky top-20 bg-gray-900 bg-opacity-50 backdrop-blur px-4 py-3 rounded-lg mb-6 z-10" data-aos="fade-down">
        <div class="flex flex-wrap items-center gap-4">
            
            
            
             <!-- Step 2: Show detected table number (from QR) -->
          <label class="text-gray-200 font-medium">Detected Table No:</label>
          <span class="text-white font-bold px-3 py-1 bg-green-700 rounded"><%= currentTableNo != null ? currentTableNo : "Not Detected" %></span>

            
            
            
<!--          <label class="text-gray-200 font-medium">Table No:</label>-->
          
          
          <%--
          
          <select name="tableNo" required class="p-2 rounded-md bg-gray-800 text-white focus:outline-none">
            <option value="" disabled>Choose</option>
            <% for(int i=1;i<=7;i++){ %>
              <option value="<%=i%>" <%=String.valueOf(i).equals(request.getParameter("tableNo"))?"selected":""%>><%=i%></option>
            <% } %>
          </select>
          
          --%>
          
          
          <button type="button" onclick="filterCategory('all');" class="category-btn px-4 py-2 rounded-full border border-indigo-500 text-indigo-200 hover:bg-indigo-500 hover:text-white transition">All</button>
          <div class="flex overflow-x-auto gap-2 py-2">
            <% Set<String> categories = new LinkedHashSet<>();
               try(Connection conn=DBConnection.getConnection(); Statement s=conn.createStatement(); ResultSet rs=s.executeQuery("SELECT DISTINCT type_of_food FROM menu_items")){
                 while(rs.next()) categories.add(rs.getString(1));
               }catch(Exception e){ }
               for(String cat:categories){ %>
              <button type="button" onclick="filterCategory('<%=cat.toLowerCase()%>')" class="category-btn px-4 py-2 whitespace-nowrap rounded-full border border-indigo-500 text-indigo-200 hover:bg-indigo-500 hover:text-white transition"> <%=cat%> </button>
            <% } %>
          </div>
        </div>
      </div>

      <!-- Menu Grid -->
      <div id="menuContainer" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <% List<Map<String,String>> menuItems=new ArrayList<>();
           try(Connection conn=DBConnection.getConnection(); Statement s=conn.createStatement(); ResultSet rs=s.executeQuery("SELECT * FROM menu_items")){
             while(rs.next()){
               Map<String,String> m=new HashMap<>();
               m.put("id",String.valueOf(rs.getInt("id")));
               m.put("name",rs.getString("name"));
               m.put("desc",rs.getString("description"));
               m.put("price",String.valueOf(rs.getDouble("price")));
               m.put("type",rs.getString("type_of_food").toLowerCase());
               m.put("image",rs.getString("image_path"));
               menuItems.add(m);
             }
           }catch(Exception e){ }
           for(Map<String,String> item:menuItems){ %>
          <div class="card-3d p-4" data-type="<%=item.get("type")%>" data-aos="zoom-in">
            <% if(item.get("image")!=null && !item.get("image").isEmpty()){ %>
              <img src="<%=item.get("image")%>" alt="<%=item.get("name")%>" class="w-full h-48 object-cover rounded-md mb-4">
            <% } else { %>
              <div class="w-full h-48 flex items-center justify-center bg-gray-700 text-gray-400 italic rounded-md mb-4">No Image</div>
            <% } %>
            <h3 class="text-xl text-white font-semibold mb-2"><%=item.get("name")%></h3>
            <p class="text-gray-300 mb-4"><%=item.get("desc")%></p>
            <div class="flex items-center justify-between">
              <span class="text-indigo-400 font-bold">Rs <%=item.get("price")%></span>
              <input type="checkbox" name="itemIds" value="<%=item.get("id")%>" class="h-5 w-5 text-indigo-500 focus:ring-indigo-400 rounded" id="item<%=item.get("id")%>">
            </div>
          </div>
        <% } %>
      </div>

      <!-- Place Order Button -->
      <!-- Fixed Sticky Place Order Button -->
      <div id="btnContainer" class="fixed bottom-6 left-1/2 transform -translate-x-1/2 z-50 transition-all duration-300">
        <button type="submit" class="btn-3d animate-pulse">Place Order</button>
      </div>
      <!-- End Button Container -->
    </form>
      

  </main>

  <%@ include file="footer.jsp" %>

  <!-- Scripts -->
  <script>
    function filterCategory(cat) {
      document.querySelectorAll('#menuContainer > div').forEach(card => {
        card.style.display = (cat === 'all' || card.dataset.type === cat) ? 'block' : 'none';
      });
      document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active-btn'));
      document.querySelectorAll('.category-btn').forEach(btn => {
        if (btn.textContent.trim().toLowerCase() === cat) btn.classList.add('active-btn');
      });
    }
  </script>
</body>
</html>

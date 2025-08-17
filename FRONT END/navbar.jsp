<%@ page session="true" %>

<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- AOS (Animate on Scroll) -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>

<!-- Navbar -->
<nav class="fixed top-0 left-0 w-full z-50 backdrop-blur-md bg-black bg-opacity-30 shadow-xl">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-16">
      <!-- Logo -->
      <a href="menu.jsp" class="flex items-center space-x-3">
        <img src="./images/png-original.png" class="h-10 w-10 object-cover transform hover:scale-110 transition duration-300 ease-in-out" alt="Canteen Logo">
       
      </a>

      <!-- Toggle -->
      <div class="md:hidden">
        <button id="mobile-menu-button" class="text-white focus:outline-none">
          <i class="fas fa-bars text-xl"></i>
        </button>
      </div>

      <!-- Links -->
      <div id="navbar-content" class="hidden md:flex md:items-center space-x-6">
        <a href="menu.jsp" class="text-white hover:text-gray-300 transition transform hover:scale-105 duration-300">
          <i class="fas fa-utensils mr-1"></i> Menu
        </a>
        <a href="userDetails.jsp?tableNo=<%=session.getAttribute("tableNo")%>" class="text-white hover:text-gray-300 transition transform hover:scale-105 duration-300">
          <i class="fas fa-user mr-1"></i> Your Details
        </a>
        <a href="order_history.jsp" class="text-white hover:text-gray-300 transition transform hover:scale-105 duration-300">
          <i class="fas fa-receipt mr-1"></i> Order Summary
        </a>

        <!-- Search Bar -->
        <div class="relative">
          <input type="text" placeholder="Search..." class="px-3 py-1 rounded-full bg-gray-800 text-white focus:outline-none" id="searchInput" onkeyup="searchMenu()">
          <i class="fas fa-search absolute right-3 top-2 text-white"></i>
        </div>

        <!-- Profile / Logout -->
        <div class="flex items-center space-x-4">
          <div class="text-white bg-white bg-opacity-10 px-4 py-2 rounded-full">
            <i class="fas fa-user-circle mr-1"></i>
            <span><%=session.getAttribute("username") != null ? session.getAttribute("username") : "Guest"%></span>
          </div>
          <a href="logout.jsp" class="text-white border border-white px-4 py-2 rounded-full hover:bg-white hover:text-black transition duration-300">
            <i class="fas fa-sign-out-alt mr-1"></i> Admin Login
          </a>
          
        </div>
      </div>
    </div>
  </div>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="md:hidden hidden bg-black bg-opacity-30 backdrop-blur-md px-4 py-4 space-y-3">
    <a href="menu.jsp" class="block text-white">Menu</a>
    <a href="userDetails.jsp?tableNo=<%=session.getAttribute("tableNo")%>" class="block text-white">Your Details</a>
    <a href="order_history.jsp" class="block text-white">Order Summary</a>
    <a href="logout.jsp" class="block text-white">Admin Login</a>
   
  </div>
</nav>

<script>
  document.getElementById('mobile-menu-button').addEventListener('click', () => {
    document.getElementById('mobile-menu').classList.toggle('hidden');
  });
  
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

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

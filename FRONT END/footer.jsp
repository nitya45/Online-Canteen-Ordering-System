<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<!-- Footer -->
<footer class="bg-black text-white py-16 px-6 relative">
  <div class="max-w-7xl mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-10 animate-fadeInUp">

    <!-- Logo + Description -->
    <div>
      <h2 class="text-2xl font-bold mb-3">FoodieCanteen</h2>
      <p class="text-gray-300">Delivering hot, tasty meals to your doorstep. Quick. Reliable. Delicious.</p>
    </div>

    <!-- Quick Links -->
    <div>
      <h3 class="text-xl font-semibold mb-4">Explore</h3>
      <ul class="space-y-2 text-gray-300">
        <li><a href="/menu" class="hover:text-white transition">Menu</a></li>
        <li><a href="/offers" class="hover:text-white transition">Offers</a></li>
        <li><a href="/track" class="hover:text-white transition">Track Order</a></li>
        <li><a href="/faq" class="hover:text-white transition">FAQ</a></li>
      </ul>
    </div>

    <!-- Contact Info -->
    <div>
      <h3 class="text-xl font-semibold mb-4">Contact</h3>
      <p class="text-gray-300">Email: Foodie@Canteen.com</p>
      <p class="text-gray-300">Phone: +91 79878 40420</p>
      <p class="text-gray-300 mb-4">Bhopal, India</p>

      <!-- Payment Logos -->
      <div class="flex items-center space-x-3">
        <img src="https://img.icons8.com/color/48/visa.png" class="w-10 h-7" alt="Visa"/>
        <img src="https://img.icons8.com/color/48/mastercard.png" class="w-10 h-7" alt="MasterCard"/>
        
        <img src="https://img.icons8.com/color/48/paypal.png" class="w-10 h-7" alt="PayPal"/>
      </div>
    </div>

    <!-- Newsletter + Social -->
    <div>
      <h3 class="text-xl font-semibold mb-4">Stay Updated</h3>
      <form class="flex flex-col sm:flex-row gap-2">
        <input type="email" placeholder="Your email"
               class="w-full px-4 py-2 rounded bg-gray-900 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-white">
        <button type="submit" class="bg-white text-black px-4 py-2 rounded hover:bg-gray-300 transition">Subscribe</button>
      </form>

       <div>
      <h3 class="text-xl font-semibold mb-4">Follow Us</h3>
      <div class="flex gap-4">
        <a href="#" class="transform hover:scale-125 transition-transform duration-300" data-aos="zoom-in">
          <img src="https://cdn-icons-png.flaticon.com/512/1384/1384063.png" alt="Facebook" class="w-8 h-8 hover:drop-shadow-[0_0_8px_#000000]" />
        </a>
        <a href="#" class="transform hover:scale-125 transition-transform duration-300" data-aos="zoom-in" data-aos-delay="100">
          <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" alt="Instagram" class="w-8 h-8 hover:drop-shadow-[0_0_8px_#000000]" />
        </a>
      </div>
    </div>
  </div>
    </div>
  </div>

  <!-- Footer Bottom -->
  <div class="text-center text-gray-400 mt-12 border-t border-gray-700 pt-6">
    &copy; 2025 <span class="text-white font-semibold">FoodieCanteen</span> | Built with Love and hot samosas.
  </div>

  <!-- Scroll To Top Button -->
  <button onclick="scrollToTop()"
          class="fixed bottom-5 right-5 bg-white text-black p-3 rounded-full shadow-lg hover:bg-gray-200 hover:scale-110 transition duration-300 z-50">
    <i class="fas fa-arrow-up"></i>
  </button>

  <!-- Floating Chat Icon -->
  
</footer>

<!-- Scroll to Top Script -->
<script>
function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
}
</script>

<!-- Fade-in Keyframes -->
<style>
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(40px); }
  to   { opacity: 1; transform: translateY(0); }
}
.animate-fadeInUp {
  animation: fadeInUp 1.2s ease-out both;
}
</style>


<!-- FOOTER HTML 
<footer class="footer">
  <div class="footer-container">
    <div class="footer-box about">
      <h2 class="footer-title">FoodDash</h2>
      <p>Delivering hot, tasty meals to your doorstep. Quick. Reliable. Delicious.</p>
    </div>

    <div class="footer-box links">
      <h3>Explore</h3>
      <ul>
        <li><a href="/menu">Our Menu</a></li>
        <li><a href="/offers">Offers</a></li>
        <li><a href="/track">Track Order</a></li>
        <li><a href="/faq">FAQ</a></li>
      </ul>
    </div>

    <div class="footer-box contact">
      <h3>Contact</h3>
      <p>Email: hello@fooddash.com</p>
      <p>Phone: +91 98765 43210</p>
      <p>Delhi, India</p>
    </div>

    <div class="footer-box social">
      <h3>Follow Us</h3>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-x-twitter"></i></a>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    &copy; 2025 <strong>FoodDash</strong> | Built with ? and hot samosas.
  </div>
</footer>

 FONT AWESOME ICONS 
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

 FOOTER CSS 
<style>
body {
  margin: 0;
  background: #000;
  color: white;
  font-family: 'Segoe UI', sans-serif;
}

.footer {
  background: linear-gradient(145deg, #000000, #1a1a1a);
  color: #ffffff;
  padding: 60px 20px 30px;
  box-shadow: 0 -5px 30px rgba(255, 255, 255, 0.1);
  animation: fadeSlideUp 1.5s ease forwards;
  border-top: 2px solid #fff;
  position: relative;
  z-index: 2;
}

.footer-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  max-width: 1200px;
  margin: auto;
}

.footer-box {
  flex: 1 1 220px;
  margin: 20px;
  transform: translateY(30px);
  animation: slideUp 1s ease forwards;
  opacity: 0;
}

.footer-box:nth-child(1) { animation-delay: 0.2s; }
.footer-box:nth-child(2) { animation-delay: 0.4s; }
.footer-box:nth-child(3) { animation-delay: 0.6s; }
.footer-box:nth-child(4) { animation-delay: 0.8s; }

.footer-title {
  font-size: 26px;
  color: #ffffff;
  margin-bottom: 15px;
}

.footer-box h3 {
  color: #ffffff;
  font-size: 18px;
  margin-bottom: 15px;
}

.footer-box ul {
  list-style: none;
  padding: 0;
}

.footer-box ul li {
  margin-bottom: 10px;
}

.footer-box ul li a {
  color: #bbb;
  text-decoration: none;
  transition: 0.3s ease;
}

.footer-box ul li a:hover {
  color: #fff;
  text-decoration: underline;
}

.footer-box p {
  color: #ccc;
  line-height: 1.6;
}

.social-icons a {
  color: #fff;
  margin-right: 15px;
  font-size: 20px;
  transition: transform 0.3s ease, color 0.3s ease;
}

.social-icons a:hover {
  color: #fff;
  transform: scale(1.3) rotate(5deg);
}

.footer-bottom {
  text-align: center;
  margin-top: 40px;
  padding-top: 15px;
  border-top: 1px solid #444;
  font-size: 14px;
  color: #aaa;
  opacity: 0.8;
}

@keyframes fadeSlideUp {
  from {
    opacity: 0;
    transform: translateY(40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideUp {
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

@media (max-width: 768px) {
  .footer-container {
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  .footer-box {
    margin: 20px 0;
  }
}
</style>-->

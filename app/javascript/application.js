// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



document.addEventListener("DOMContentLoaded", () => {
  const header = document.getElementById("main-header");

  window.addEventListener("scroll", () => {
    if (window.scrollY > 50) {
      header.classList.add("py-2", "shadow-lg", "bg-opacity-100");
      header.classList.remove("py-6", "bg-opacity-90");
    } else {
      header.classList.remove("py-2", "shadow-lg", "bg-opacity-100");
      header.classList.add("py-6", "bg-opacity-90");
    }
  });
});

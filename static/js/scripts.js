function toggleTheme() {
  const isDark = document.body.classList.toggle('dark-mode');
  localStorage.setItem("theme", isDark ? "dark" : "light");
  document.getElementById("theme-icon").className = isDark ? "fas fa-sun" : "fas fa-moon";
}

window.onload = () => {
  const mode = localStorage.getItem("theme");
  const isDark = mode === "dark";
  if (isDark) document.body.classList.add("dark-mode");
  document.getElementById("theme-icon").className = isDark ? "fas fa-sun" : "fas fa-moon";

};
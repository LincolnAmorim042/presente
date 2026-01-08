<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lincoln Amorim</title>
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <header>
        <h1>Lincoln Amorim - Social Media</h1>
    </header>
    <button class="toggle-theme" onclick="toggleTheme()">
        <i id="theme-icon" class="fas fa-moon"></i>
    </button>

    <section class="portfolio">
        <h2>Projetos</h2>
        <div class="grid">
            <div class="card"><img src="/static/img/sample1.jpg" alt="Post 1"></div>
            <div class="card"><img src="/static/img/sample2.jpg" alt="Post 2"></div>
            <div class="card"><img src="/static/img/sample3.jpg" alt="Post 3"></div>
            <div class="card">
                <video controls poster="/static/img/sample1.jpg" style="width: 100%; display: block;">
                    <source src="/static/video/project1.mp4" type="video/mp4" alt="Post 4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>
    </section>

    <section class="about">
        <h2>Sobre mim</h2>
        <p>Trabalhei como diretor de marketing da A.A.A. COMP - Dourados entre Agosto de 2022 e Fevereiro de 2024</p>
    </section>

    <section class="contact">
        <h2>Contato:</h2>
        <p>Estou aberto a oportunidades e colaborações</p>
        <p><i class="fas fa-envelope"></i> <strong>lincolnmamorim@hotmail.com</strong></p>
        <p><i class="fab fa-linkedin"></i> <a href="#" target="_blank">linkedin.com/in/lincoln-amorim-4434a0191/</a></p>
        <p><i class="fab fa-github"></i> <a href="#" target="_blank">github.com/LincolnAmorim042</a></p>
    </section>

    <footer>
        <p>&copy; 2025 Lincoln. Feito com amor.</p>
    </footer>

    <script src="/static/js/scripts.js"></script>
</body>
</html>


<!DOCTYPE html>
<html>
<head>
    <title>te amo</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/teamo.css">
    <script>
        function updateMessage() {
            fetch('/time')
                .then(response => response.json())
                .then(data => {
                    document.getElementById("elapsed").innerText = data.message;
                });
        }
        setInterval(updateMessage, 1000);

        const images = ["amor1.jpeg", "amor2.jpeg", "amor3.jpeg", "amor4.jpeg", "amor5.jpeg"];

        function getNextImageIndex() {
            let currentIndex = parseInt(localStorage.getItem('imageIndex')) || 0;
            let nextIndex = (currentIndex + 1) % images.length;
            localStorage.setItem('imageIndex', nextIndex);
            return nextIndex;
        }

        window.onload = function() {
            const img = document.getElementById("cycledImage");
            const index = getNextImageIndex();
            img.onload = () => { img.style.opacity = 1; };
            img.src = "/static/img/" + images[index];
            updateMessage();
        };
    </script>
</head>
<body>
    <img id="cycledImage" src="" alt="Image">
    <h2 id="elapsed">Loading...</h2>
</body>
</html>
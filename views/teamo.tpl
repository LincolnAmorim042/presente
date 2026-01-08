<!DOCTYPE html>
<html>
<head>
    <title>te amo</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/teamo.css">

    <style>
        canvas {
            position: fixed;
            top: 0;
            left: 0;
            pointer-events: none;
            z-index: 999;
        }
    </style>

    <script>
        let confettiRunning = false;

        function updateMessage() {
            fetch('/time')
                .then(response => response.json())
                .then(data => {
                    document.getElementById("elapsed").innerText = data.message;
                    document.getElementById("extra").innerText = data.extra_message || "";

                    if (data.confetti && !confettiRunning) {
                        startConfetti();
                        confettiRunning = true;
                    }
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

        /* 🎉 CONFETTI */
        function startConfetti() {
            const canvas = document.createElement("canvas");
            document.body.appendChild(canvas);
            const ctx = canvas.getContext("2d");

            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            const confettiCount = 150;
            const confetti = [];

            const colors = ["#ff4d6d", "#ffd166", "#06d6a0", "#4cc9f0", "#f72585"];

            for (let i = 0; i < confettiCount; i++) {
                confetti.push({
                    x: Math.random() * canvas.width,
                    y: Math.random() * canvas.height - canvas.height,
                    r: Math.random() * 6 + 4,
                    d: Math.random() * confettiCount,
                    color: colors[Math.floor(Math.random() * colors.length)],
                    tilt: Math.random() * 10 - 10,
                    tiltAngleIncrement: Math.random() * 0.07 + 0.05,
                    tiltAngle: 0
                });
            }

            function draw() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);

                confetti.forEach(c => {
                    ctx.beginPath();
                    ctx.lineWidth = c.r;
                    ctx.strokeStyle = c.color;
                    ctx.moveTo(c.x + c.tilt + c.r, c.y);
                    ctx.lineTo(c.x + c.tilt, c.y + c.tilt + c.r);
                    ctx.stroke();
                });

                update();
                requestAnimationFrame(draw);
            }

            function update() {
                confetti.forEach(c => {
                    c.tiltAngle += c.tiltAngleIncrement;
                    c.y += (Math.cos(c.d) + 3 + c.r / 2) / 2;
                    c.x += Math.sin(c.d);
                    c.tilt = Math.sin(c.tiltAngle) * 15;

                    if (c.y > canvas.height) {
                        c.y = -20;
                        c.x = Math.random() * canvas.width;
                    }
                });
            }

            draw();
        }
    </script>
</head>

<body>
    <img id="cycledImage" src="" alt="Image">
    <h2 id="elapsed">Loading...</h2>
    <h3 id="extra"></h3>


</body>
</html>

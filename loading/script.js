document.addEventListener("DOMContentLoaded", () => {
  const statusText = document.getElementById("statusText");
  const progressFill = document.getElementById("progressFill");
  const progressPercent = document.getElementById("progressPercent");
  const serverName = document.getElementById("serverName");
  const gameMode = document.getElementById("gameMode");
  const mapName = document.getElementById("mapName");
  const playerName = document.getElementById("playerName");
  const playerSteamId = document.getElementById("playerSteamId");
  const playerAvatar = document.getElementById("playerAvatar");
  const playerInitial = document.getElementById("playerInitial");
  const backgroundAudio = document.getElementById("backgroundAudio");
  const audioControl = document.getElementById("audioControl");

  // --- Музыка ---
  audioControl.addEventListener("click", () => {
    if (backgroundAudio.paused) {
      backgroundAudio.play();
      audioControl.textContent = "🔊";
    } else {
      backgroundAudio.pause();
      audioControl.textContent = "🔇";
    }
  });

  // --- API Garry’s Mod ---
  window.SetStatusChanged = function(status) {
    statusText.textContent = status;
  };

  window.SetFilesTotal = function(total) {
    progressFill.style.width = "0%";
    progressPercent.textContent = "0%";
  };

  window.SetFilesNeeded = function(needed) {
    const total = parseInt(progressFill.style.width) || 0;
    const percent = 100 - (needed / total) * 100;
    progressFill.style.width = percent + "%";
    progressPercent.textContent = Math.round(percent) + "%";
  };

  window.SetFilesDownloaded = function(downloaded) {
    const percent = (downloaded / 100) * 100;
    progressFill.style.width = percent + "%";
    progressPercent.textContent = Math.round(percent) + "%";
  };

  window.GameDetails = function(server, gm, map, name, sid, avatar) {
    serverName.textContent = server;
    gameMode.textContent = gm;
    mapName.textContent = map;
    playerName.textContent = name;
    playerSteamId.textContent = sid;

    if (avatar && avatar.length > 0) {
      playerAvatar.src = avatar;
      playerAvatar.style.display = "block";
      playerInitial.style.display = "none";
    } else {
      playerAvatar.style.display = "none";
      playerInitial.textContent = name.charAt(0).toUpperCase();
      playerInitial.style.display = "flex";
    }
  };
});

  // --- Смена фоновых картинок ---
  const body = document.body;
  let currentIndex = 0;
  let images = [];

  fetch("images.json")
    .then(res => res.json())
    .then(data => {
      images = data.map(file => `img/${file}`);
      if (images.length > 0) {
        changeBackground();
        setInterval(changeBackground, 120000); // каждые 2 минуты
      }
    })
    .catch(err => console.error("Не удалось загрузить список картинок:", err));

  function changeBackground() {
    body.style.backgroundImage = `url(${images[currentIndex]})`;
    body.style.backgroundSize = "cover";
    body.style.backgroundPosition = "center";
    body.style.backgroundRepeat = "no-repeat";
    body.style.transition = "background-image 1s ease-in-out";

    currentIndex = (currentIndex + 1) % images.length;
  }
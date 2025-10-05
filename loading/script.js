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

  // --- Баннер ---
  const bannerBox = document.querySelector(".banner-box");
  const bannerClose = document.querySelector(".banner-close");
  if (bannerBox && bannerClose) bannerClose.addEventListener("click", () => bannerBox.style.display = "none");

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

  // --- Чтение параметров из URL ---
  const params = new URLSearchParams(window.location.search);
  const sid = params.get("sid");
  const name = params.get("name");
  const avatar = params.get("avatar");

  if (sid) playerSteamId.textContent = sid;
  if (name) playerName.textContent = decodeURIComponent(name);
  if (avatar) {
    playerAvatar.src = avatar;
    playerAvatar.style.display = "block";
    playerInitial.style.display = "none";
  }

  // --- Фолбэк для стандартного вызова GMod ---
  window.GameDetails = function(servername, serverurl, mapname, maxplayers, steamid, gamemode) {
    serverName.textContent = servername;
    mapName.textContent = mapname;
    gameMode.textContent = gamemode;
    playerSteamId.textContent = steamid || "N/A";

    if (!name) playerName.textContent = "Player " + (steamid || "");
  };

  // --- Обновление статуса и загрузки ---
  window.SetStatusChanged = function(status) { statusText.textContent = status; };
  let totalFiles = 0, neededFiles = 0;

  window.SetFilesTotal = function(total) {
    totalFiles = total; neededFiles = total;
    progressFill.style.width = "0%";
    progressPercent.textContent = "0%";
  };
  window.SetFilesNeeded = function(needed) { neededFiles = needed; updateProgress(); };
  window.SetFilesDownloaded = function(downloaded) {
    const percent = (downloaded / totalFiles) * 100;
    progressFill.style.width = percent + "%";
    progressPercent.textContent = Math.round(percent) + "%";
  };

  function updateProgress() {
    if (totalFiles > 0) {
      const downloaded = totalFiles - neededFiles;
      const percent = (downloaded / totalFiles) * 100;
      progressFill.style.width = percent + "%";
      progressPercent.textContent = Math.round(percent) + "%";
    }
  }

  // --- Фоновые картинки ---
  let currentIndex = 0, images = [];
  fetch("images.json")
    .then(res => res.json())
    .then(data => {
      images = data.map(f => `img/${f}`);
      if (images.length) {
        changeBackground();
        setInterval(changeBackground, 120000);
      }
    })
    .catch(err => console.error("Не удалось загрузить список картинок:", err));

  function changeBackground() {
    document.body.style.backgroundImage = `url(${images[currentIndex]})`;
    document.body.style.backgroundSize = "cover";
    document.body.style.backgroundPosition = "center";
    document.body.style.backgroundRepeat = "no-repeat";
    document.body.style.transition = "background-image 1s ease-in-out";
    currentIndex = (currentIndex + 1) % images.length;
  }
});

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
  const mainContent = document.getElementById("mainContent");
  const accessDenied = document.getElementById("accessDenied");

  // Проверка окружения: доступно только из Garry's Mod
  const isGmod = window.location.search.includes("gmod");
  if (!isGmod) {
    mainContent.style.display = "none";
    accessDenied.style.display = "flex";
    return;
  }

  // Музыка
  audioControl.addEventListener("click", () => {
    if (backgroundAudio.paused) {
      backgroundAudio.play();
      audioControl.textContent = "🔊";
    } else {
      backgroundAudio.pause();
      audioControl.textContent = "🔇";
    }
  });

  // API Garry’s Mod
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

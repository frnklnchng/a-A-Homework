document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas")
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 50, 0, 2 * Math.PI, true);
  ctx.strokeStyle = "white";
  ctx.lineWidth = 15;
  ctx.stroke();
  ctx.fillStyle = "teal";
  ctx.fill();

  ctx.beginPath();
  ctx.fillStyle = "white";
  ctx.moveTo(75, 50);
  ctx.lineTo(75, 100);
  ctx.lineTo(25, 100);
  ctx.fill();
});

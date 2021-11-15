var canvas = document.querySelector("canvas");
canvas.width = 1024;
canvas.height = 1024;

var lightColour = "rgba(232,209,155)";
var darkColour = "rgba(137,85,9)";

var ctx = canvas.getContext("2d");
// Creates checkerboard
for (let rank = 0; rank < 8; rank++) {
  for (let file = 0; file < 8; file++) {
    if (rank % 2 == 0) {
      if (file % 2 == 0) {
        ctx.fillStyle = lightColour;
        ctx.fillRect(128 * file, 128 * rank, 128, 128);
      } else {
        ctx.fillStyle = darkColour;
        ctx.fillRect(128 * file, 128 * rank, 128, 128);
      }
    } else {
      if (file % 2 != 0) {
        ctx.fillStyle = lightColour;
        ctx.fillRect(128 * file, 128 * rank, 128, 128);
      } else {
        ctx.fillStyle = darkColour;
        ctx.fillRect(128 * file, 128 * rank, 128, 128);
      }
    }
  }
}



class Piece {
  constructor(x, y, id) {
    this.x = x;
    this.y = y;
    this.id = id;
    this.img = document.getElementById(id);
    this.draw = function () {
      ctx.drawImage(this.img, x, y);
    };
  }
}
//function draw() {
//  var img = document.getElementById("bKnight0");
//  ctx.drawImage(img, 128, 128);
//}
console.log(canvas);

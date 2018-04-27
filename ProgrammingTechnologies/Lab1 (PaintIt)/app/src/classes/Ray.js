/**
* Generated On: 2018-2-28
* Class: Ray
*/

const OneDShape = require('./OneDShape').default;

export default class Ray extends OneDShape {
  draw(context, canvas) {
    const y = (this.endPoint.y < this.startPoint.y) ? 0 : canvas.width;
    const x = this.startPoint.x + (y - this.startPoint.y) *
      (this.endPoint.x - this.startPoint.x) / (this.endPoint.y - this.startPoint.y);
    context.beginPath();
    context.moveTo(
      this.startPoint.x,
      this.startPoint.y,
    );
    context.lineTo(x, y);
    context.strokeStyle = this.borderColor;
    context.lineWidth = 3;
    context.stroke();
  }
}

/**
* Generated On: 2018-2-28
* Class: Line
*/

const OneDShape = require('./OneDShape').default;

export default class Line extends OneDShape {
  draw(context, canvas) {
    const newY1 = (this.endPoint.y < this.startPoint.y) ? canvas.width : 0;
    const newY2 = (this.endPoint.y < this.startPoint.y) ? 0 : canvas.width;
    const newX1 = this.startPoint.x + ((newY1 - this.startPoint.y) *
      (this.startPoint.x - this.endPoint.x) / (this.startPoint.y - this.endPoint.y));
    const newX2 = this.startPoint.x + ((newY2 - this.startPoint.y) *
      (this.startPoint.x - this.endPoint.x) / (this.startPoint.y - this.endPoint.y));
    context.beginPath();
    context.moveTo(
      newX1,
      newY1,
    );
    context.lineTo(
      newX2,
      newY2,
    );
    context.strokeStyle = this.borderColor;
    context.lineWidth = 3;
    context.stroke();
  }
}

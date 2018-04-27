/**
* Generated On: 2018-2-28
* Class: LineSegment
*/

const OneDShape = require('./OneDShape').default;

export default class LineSegment extends OneDShape {
  draw(context) {
    context.beginPath();
    context.moveTo(
      this.startPoint.x,
      this.startPoint.y,
    );
    context.lineTo(
      this.endPoint.x,
      this.endPoint.y,
    );
    context.strokeStyle = this.borderColor;
    context.lineWidth = 3;
    context.stroke();
  }
}

/**
* Generated On: 2018-2-28
* Class: RegularPolygon
*/

const IrregularPolygon = require('./IrregularPolygon').default;

export default class RegularPolygon extends IrregularPolygon {
  constructor(borderColor, options) {
    super(borderColor, options);
    this.radius = options.radius;
    this.numberOfSides = options.numberOfSides;
  }

  draw(context) {
    this.generateVertices(this.center.x, this.center.y, this.numberOfSides, this.radius);
    super.draw(context);
  }

  generateVertices(centerX, centerY, sides, radius) {
    const angle = 2 * Math.PI / sides;
    for (let i = 0; i < sides; i += 1) {
      this.points.push({
        x: centerX + radius * Math.sin(i * angle),
        y: centerY + radius * Math.cos(i * angle),
      });
    }
  }

  get numberOfSides() {
    return this._numberOfSides;
  }

  set numberOfSides(numberOfSides) {
    this._numberOfSides = numberOfSides;
  }
}

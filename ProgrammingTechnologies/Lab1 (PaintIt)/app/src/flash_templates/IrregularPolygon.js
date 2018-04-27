import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars

export default class IrregularPolygon extends Component {
  render() {
    return (
      <p className="uk-width-4-5 uk-margin-remove-top">
        To draw a polygon click on the panel to set its vertices.
        To finish drawing, double click to set the last vertice position.
        You can select border and background color.
      </p>
    );
  }

  componentDidMount() {
    this.props.didMount();
  }
}

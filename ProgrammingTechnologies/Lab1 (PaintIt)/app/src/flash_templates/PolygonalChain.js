import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars

export default class PolygonalChain extends Component {
  render() {
    return (
      <p className="uk-width-4-5 uk-margin-remove-top">
        To draw a polygonal chain click on the panel to set the positions of the vertices.
        To finish drawing double click to set the last vertice.
        You can select border color.
      </p>
    );
  }

  componentDidMount() {
    this.props.didMount();
  }
}

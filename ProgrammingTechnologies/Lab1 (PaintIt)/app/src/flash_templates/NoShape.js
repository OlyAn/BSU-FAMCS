import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars

export default class NoShape extends Component {
  render() {
    return (
      <p className="uk-width-4-5 uk-margin-remove-top">
        Please select a shape you want to draw by clicking on the buttons above.
      </p>
    );
  }

  componentDidMount() {
    this.props.didMount();
  }
}

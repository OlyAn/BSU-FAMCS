import React, { Component } from 'react'; // eslint-disable-line no-unused-vars

const imports = {
  LineSegment: require('./classes/LineSegment').default,
  Ray: require('./classes/Ray').default,
  Line: require('./classes/Line').default,
  IrregularPolygon: require('./classes/IrregularPolygon').default,
  RegularPolygon: require('./classes/RegularPolygon').default,
  PolygonalChain: require('./classes/PolygonalChain').default,
  Circle: require('./classes/Circle').default,
  Ellipse: require('./classes/Ellipse').default,
  LineFlash: require('./flash_templates/Line').default,
  LineSegmentFlash: require('./flash_templates/LineSegment').default,
  RayFlash: require('./flash_templates/Ray').default,
  PolygonalChainFlash: require('./flash_templates/PolygonalChain').default,
  CircleFlash: require('./flash_templates/Circle').default,
  EllipseFlash: require('./flash_templates/Ellipse').default,
  RegularPolygonFlash: require('./flash_templates/RegularPolygon').default,
  IrregularPolygonFlash: require('./flash_templates/IrregularPolygon').default,
  NoShapeSelected: require('./flash_templates/NoShape').default,
};

function callConstructor(ClassName, borderColor, options) {
  return new imports[ClassName](borderColor, options);
}

function addIconsToFlashes() {
  const flashes = document.getElementsByClassName('flash-icon');
  [].forEach.call(flashes, (i) => {
    i.setAttribute('uk-icon', 'icon: warning; ratio: 2');
  });
}

const FLASHES = {
  Line: React.createElement(imports.LineFlash, { didMount: addIconsToFlashes }),
  Ray: React.createElement(imports.RayFlash, { didMount: addIconsToFlashes }),
  LineSegment: React.createElement(imports.LineSegmentFlash, { didMount: addIconsToFlashes }),
  PolygonalChain: React.createElement(imports.PolygonalChainFlash, { didMount: addIconsToFlashes }),
  Circle: React.createElement(imports.CircleFlash, { didMount: addIconsToFlashes }),
  Ellipse: React.createElement(imports.EllipseFlash, { didMount: addIconsToFlashes }),
  IrregularPolygon:
    React.createElement(imports.IrregularPolygonFlash, { didMount: addIconsToFlashes }),
  RegularPolygon: React.createElement(imports.RegularPolygonFlash, { didMount: addIconsToFlashes }),
  NoShapeSelected: React.createElement(imports.NoShapeSelected, { didMount: addIconsToFlashes }),
};

function flash(shape) {
  return (
    <div>
      {FLASHES[shape]}
    </div>
  );
}

export { imports, flash, FLASHES, addIconsToFlashes, callConstructor };

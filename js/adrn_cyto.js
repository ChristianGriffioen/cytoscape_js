var json = fetch("data/20181101_CRC1.json")
    .then(response => response.json())

var cy = window.cy = cytoscape({
  container: document.getElementById('cyadrn'),
  boxSelectionEnabled: false,
  autounselectify: true,
  layout: {
    name: 'circle'
  },
  style: [
    {
      selector: 'node',
      style: {
        'text-valign':'center',
        'text-halign':'center',
        "font-size": 25,
        "content": "data(id)",
        'height': 20,
        'width': 20,
        'background-color': 'lightblue'
      }
    },
    {
      selector: 'edge',
      style: {
        'mid-source-arrow-color': 'red',
        'mid-source-arrow-shape': 'triangle-backcurve',
        'arrow-scale': 0.5,
        'control-point-distance': 50,
        'curve-style': 'unbundled-bezier',
        'width': 5,
        'opacity': 0.6,
        'line-color': 'blue'
      }
    }
  ],
  elements: json
});


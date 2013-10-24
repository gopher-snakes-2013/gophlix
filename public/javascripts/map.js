var startMap = function() {

  var width = 960,
      height = 600;

  var force = d3.layout.force()
      .linkDistance(50)
      .charge(-400)
      .size([width, height])
      .on("tick", tick);

  var border = 3;
  var borderColor = "gray";

  $('#map').empty();
  var svg = d3.select("#map").append("svg")
      .attr("width", width)
      .attr("height", height)
      .attr("border", border);

  var borderPath = svg.append("rect")
      .attr("x", 0)
      .attr("y", 0)
      .attr("height", height)
      .attr("width", width)
      .style("stroke", borderColor)
      .style("fill", "none")
      .style("stroke-width", border);

  var link = svg.selectAll(".link"),
      node = svg.selectAll(".node");

  update();

  function update() {
    var nodes = flatten(persons_data),
        links = d3.layout.tree().links(nodes);

    // Restart the force layout.
    force
        .nodes(nodes)
        .links(links)
        .start();

    // Update the links…
    link = link.data(links, function(d) { return d.target.id; });

    // Exit any old links.
    link.exit().remove();

    // Enter any new links.
    link.enter().insert("line", ".node")
        .attr("class", "link")
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    // Update the nodes…
    node = node.data(nodes, function(d) { return d.id; }).style("fill", color);

    // Exit any old nodes.
    node.exit().remove();

    // Enter any new nodes.
    node.enter().append("circle")
        .attr("class", "node")
        .attr("cx", function(d) { return d.x; })
        .attr("cy", function(d) { return d.y; })
        .attr("r", function(d) { return ( d.match * d.match * 15) })
        // circle radius =  "size" or "match" attr of each object
        .style("fill", color)
        .on("click", click)
        .call(force.drag);

    // Shows node names on mouseover
    node.append("title")
      .text(function(d) { return d.name; });
  }


  function tick() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("cx", function(d) { return d.x; })
        .attr("cy", function(d) { return d.y; });
  }



  // Color leaf nodes orange, and packages white or blue.
  function color(d) {

    // sets colors.  higher match => greater saturation
    scale_parents = d3.scale.linear()
           .domain([0, .7, 1])
           .range(["white", "yellow", "green"]);

    scale_children = d3.scale.linear()
           .domain([0, .7, 1])
           .range(["white", "gray", "blue"]);

    if (d.children && d.match === 1) {return "orange"}
    else if (d._children){ return scale_parents(d.match)}
    else if (d.children){ return scale_parents(d.match)}
    else { return scale_children(d.match);}
  }


  // Toggle children on click.
  function click(d) {
    if (!d3.event.defaultPrevented) {
      if (d.children) {
        d._children = d.children;
        d.children = null;
      } else {
        d.children = d._children;
        d._children = null;
      }
      update();
    }
  }

  // Returns a list of all nodes under the root.
  function flatten(persons_data) {
    var nodes = [], i = 0;

    function recurse(node) {
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);
    }

    recurse(persons_data);
    return nodes;
  }
}

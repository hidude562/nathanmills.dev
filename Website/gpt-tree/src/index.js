import data from "./flare.json";
import Sunburst from "sunburst-chart";
import * as d3 from "d3";

const color = d3.scaleOrdinal(d3.schemeAccent);
Sunburst()
  .data(data)
  .label("name")
  .size("size")
  .color((d, parent) => color(parent ? parent.data.name : null))
  .tooltipContent((d, node) => `Size: <i>${node.value}</i>`)(
  document.getElementById("chart")
);

function script() {

  const farmPullDownButton = document.getElementById("farm-select")
  const farmPullDownBox = document.getElementById("farm-pull-down")
  const storePullDownButton = document.getElementById("store-select")
  const storePullDownBox = document.getElementById("store-pull-down")
  const itemBox = document.getElementById("item-box")

  if (!farmPullDownButton){ return false;}
  farmPullDownButton.addEventListener('mouseover', function() {
    this.setAttribute("style", "color:red;")
  });

  farmPullDownButton.addEventListener('mouseout', function() {
    this.removeAttribute("style", "color:red;")
  });

  storePullDownButton.addEventListener('mouseover', function() {
    this.setAttribute("style", "color:red;")
  });

  storePullDownButton.addEventListener('mouseout', function() {
    this.removeAttribute("style", "color:red;")
  });

  itemBox.addEventListener('mouseover', function() {
    this.setAttribute("style", "color:red")
  });

  itemBox.addEventListener('mouseout', function() {
    this.removeAttribute("style", "color:red;")
  });

  farmPullDownButton.addEventListener('click', function() {
    if(storePullDownBox.getAttribute("style") == "display:block") {
      storePullDownBox.removeAttribute("style") == "display:block"
    }
    if (farmPullDownBox.getAttribute("style") == "display:block") {
      farmPullDownBox.removeAttribute("style", "display:block")
    } else {
    farmPullDownBox.setAttribute("style", "display:block");
    }
  });

  storePullDownButton.addEventListener('click', function() {
    if(farmPullDownBox.getAttribute("style") == "display:block") {
      farmPullDownBox.removeAttribute("style") == "display:block"
    }

    if (storePullDownBox.getAttribute("style") == "display:block") {
      storePullDownBox.removeAttribute("style", "display:block")
    } else {
      storePullDownBox.setAttribute("style", "display:block");
    }
  });
};
window.addEventListener('load', script)

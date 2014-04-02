$(document).ready ->
	lineScratch.draw()
	$(".path-data-input").val(lineScratch.pathDataString)
	$(".path-data-input").keypress ->
		newPathData = $(".path-data-input").val()
		console.log newPathData
		lineScratch.pathDataString = newPathData
		lineScratch.draw()

lineScratch =
	pathDataString: "M100,200 C100,100 250,100 250,200 S400,300 400,200"
	
	draw: ->
		scratchPath = @buildPath(@pathDataString, "scratch-path")
		$("svg").empty()
		$("svg").append(scratchPath)

	buildPath: (pathDataString, pathClass) ->
		path = document.createElementNS("http://www.w3.org/2000/svg", "path")
		path.setAttribute("d", pathDataString)
		path.setAttribute("class", pathClass)
		path

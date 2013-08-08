first =
	init: ->
		@initBindings()
		@everyoneGetsBoxes(100)

	initBindings: ->
		$(document).on "click", ".box", (e) ->
			$currentTarget = $(e.currentTarget)
			$currentTarget.addClass("gocrazy")

	everyoneGetsBoxes: (num) ->
		_(num).times (i) -> 
			$newBox = $("<div></div>").addClass("box").attr("id", "box" + i)
			$("body").append $newBox

first.init()

_.each $(".box"), (box, i) ->
	console.log box
	newColor = "rgba(" + (i*3232)%255 + "," + (i*12319)%255 + "," + (i*242340)%255 + ",50)"
	$(box).css "background-color", newColor
	$(box).css "-webkit-transition", i * 0.1 + "s all linear"
	$(box).css "-webkit-transform-origin", (i*23930)%500 + "%" + (i*392023)%500 + "%"
	$(box).addClass "gocrazy"
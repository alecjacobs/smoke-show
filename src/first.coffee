rand = (top) ->
	Math.floor((Math.random()*top)+1)

randWithNegs = (maxMin) ->
	Math.floor((Math.random()*top)-1)

first =
	init: ->
		@everyoneGetsBoxes(100)
		@initBindings()
		@run()

	initBindings: ->
		$(".launch-box").click (e) ->
			first.run()

		$("body").click ->
			first.run

		$(document).on "click", ".box", (e) ->
			$currentTarget = $(e.currentTarget)
			$currentTarget.addClass("gocrazy")

	everyoneGetsBoxes: (num) ->
		_(num).times -> 
			boxCount = $(".box").length
			boxId = boxCount + 1
			newColor = "rgba(" + rand(255) + "," + rand(255) + "," + rand(255) + ",50)"
			$newBox = $("<div></div>").addClass("box").attr("id", "box" + boxId)

			$(".main.wrapper").prepend $newBox
			boxId

	transformBox: ($box) ->
		newColor = "rgba(" + rand(255) + "," + rand(255) + "," + rand(255) + ",50)"

		$box.css "-webkit-transition", "1s all linear"
		$box.css "background-color", newColor
		$box.css "-webkit-transform-origin", rand(500) + "%" + rand(500) + "%"
		$box.css "-webkit-transform", "rotate(" + rand(360) + "deg)"

	run: ->
		boxId = first.everyoneGetsBoxes(1)
		first.transformBox($("#box" + boxId))
		


first.initBindings()

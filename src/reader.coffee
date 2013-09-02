window.reader =
	text: []
	position: 0

	init: ->
		reader.renderReadTape()
		reader.setupPageText()
		reader.updateTape(reader.position)
		reader.initBindings()

	initBindings: ->
		KeyboardJS.on('left', reader.moveLeft)
		KeyboardJS.on('right', reader.moveRight)

	setupPageText: ->
		raw_text = $('body').children(":visible").text()
		reader.text = reader.cleanupText(raw_text)

	moveLeft: ->
		if reader.position > 0
			reader.position -= 1
			reader.updateTape(reader.position)

	moveRight: ->
		if reader.position < reader.text.length
			reader.position += 1
			reader.updateTape(reader.position)

	updateTape: (position) ->
		leftText = ""

		if position == 0
			leftText = ""
		else
			leftText = reader.text.slice(0, position).join(" ")

		rightText = reader.text.slice(position + 1, reader.text.length).join(" ")
		focusText = reader.text[position]

		reader.populateLeftTape(leftText)
		reader.populateRightTape(rightText)
		reader.populateFocus(focusText)

	cleanupText: (text) ->
		text = text.replace("↵", "")
		text = text.split(' ')

	renderReadTape: ->
		$('body').prepend("<span class='tape left'></span><span class='focus'></span><span class='tape right'></span>")

	populateLeftTape: (str) ->
		$('.tape.left').text(str)

	populateRightTape: (str) ->
		$('.tape.right').text(str)

	populateFocus: (str) ->
		$('.focus').text(str)

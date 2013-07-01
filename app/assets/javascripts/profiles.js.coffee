# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
	sound = true

	$('.move').click ->
		$(this).next('.bmode').slideToggle()

	# Uses move when double clicked
	$('.use-move').click ->
		$checkbox = $(this).next('.edit_move').find(':checkbox')
		$checkbox.prop('checked', !$checkbox[0].checked)
		$checkbox.parent('form').submit()

	# # resets battle mode
	$('#end-battle').click ->
		$('input:checkbox').removeAttr 'checked'
		for $item in $('input:checkbox')
			$($item).parent('form').submit()
		$('.bmode').hide()
		$('.true').fadeIn()
		$('.false').fadeIn()

	$('.moves').cycle({
		paused: true
	})

	$('.moves').on( 'cycle-after', (e, optionHash, outgoingSlideEl, incomingSlideEl, forwardFlag )->
		hello = ($(incomingSlideEl).html())
		if sound
			speak(hello, {pitch: 70, speed:130})
	)

	$('#start').on 'click', ->
		if $(this).hasClass('btn-success')
			$('.moves').cycle('resume')
			$(this).text('Stop').removeClass('btn-success').addClass('btn-danger')
		else
			console.log 'pause'
			$('.moves').cycle('pause')
			$(this).text('Start').removeClass('btn-danger').addClass('btn-success') 

	$('.vol-btn').on 'click', ->
		if $(this).hasClass('vol-off')
			$(this).addClass('hide')
			$('.vol-on').removeClass('hide')
			sound = true
		else if $(this).hasClass('vol-on')
			$(this).addClass('hide')
			$('.vol-off').removeClass('hide')
			sound = false

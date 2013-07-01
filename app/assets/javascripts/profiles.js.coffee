# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
	$('.move').click ->
		$(this).next('.bmode').slideToggle()

	# Uses move when double clicked
	$('.use-move').click ->
		$checkbox = $(this).next('.edit_move').find(':checkbox')
		$checkbox.prop('checked', !$checkbox[0].checked)
		$checkbox.parent('form').submit()


	# resets battle mode
	$('#end-battle').click ->
		$('input:checkbox').removeAttr 'checked'
		for $item in $('input:checkbox')
			$($item).parent('form').submit()
		$('.bmode').hide()
		$('.true').fadeIn()
		$('.false').fadeIn()

	# $('.move-call-out .move').eq(0).addClass('show-move')


	# $oldMove = 0
	# $newMove = 0
	# fadeMove = ->
	# 	$('.move-call-out .move').eq(oldMove).removeClass('show-move')
	# 	$('.move-call-out .move').eq(newMove).addClass('show-move')
	# 	hello = ($('.show-move').html())
	# 	speak(hello, {pitch: 70, speed:130})

	# 	fadeNewMove


	# fadeNewMove = ->
	# 	console.log stop
	# 	if (stop == false)
	# 		$oldMove = $newMove
	# 		$newMove = Math.floor(Math.random()*$('.moves').children().length)
	# 		setTimeout -> 
	# 			fadeMove($oldMove, $newMove)
	# 		,5000

	# $('#start').on 'click', ->

	$('.moves').cycle({
		paused: true
	})

	$('.moves').on( 'cycle-after', (e, optionHash, outgoingSlideEl, incomingSlideEl, forwardFlag )->
		hello = ($(incomingSlideEl).html())
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

# 		$(".cycle-prev").toggle(function(){

#     $(".cycle-slideshow").cycle("pause");
# },function(){

#     $(".cycle-slideshow").cycle("resume");
# });
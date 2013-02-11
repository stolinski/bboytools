# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
	$('.move').click ->
		$(this).next('.bmode').slideToggle()
	$('.use-move').click ->
		$checkbox = $(this).next('.edit_move').find(':checkbox')
		$checkbox.prop('checked', !$checkbox[0].checked)
		$checkbox.parent('form').submit()
	$('#end-battle').click ->
		$('input:checkbox').removeAttr 'checked'
		for $item in $('input:checkbox')
			$($item).parent('form').submit()
		$('.bmode').hide()
		$('.true').fadeIn()
		$('.false').fadeIn()


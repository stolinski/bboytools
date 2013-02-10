# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
	$('.use-move').click ->
		$checkbox = $(this).next('.edit_move').find(':checkbox')
		$checkbox.prop('checked', !$checkbox[0].checked)
		$checkbox.parent('form').submit()


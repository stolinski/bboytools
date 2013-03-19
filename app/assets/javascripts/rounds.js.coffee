# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('.round h3').click ->
		$(this).next('.round-moves').toggleClass('open-round').slideToggle()
		$(this).parents('.round').toggleClass('open')

	$('.icon-remove-circle').click ->
		$(this).parents('.move').fadeOut()

	$('.add-moves').click ->
		$yo = $(this).children('input').val()
		$('.round_id').val($yo)
		$('.active').removeClass('active')
		$(this).parents('.round').addClass('active')

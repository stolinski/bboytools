# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$ ->
	$('.move').click ->
		$(this).children('.move-deets').slideToggle()


	$('.moves').sortable(
    	axis: 'y'
    	handle: '.move-name'
    	update: ->
    		console.log "yo"
	)

	$container = $('.moves-container')
	$checkboxes = $('#filters input')

	$container.isotope(
		itemSelector: '.move-type-wrap'
	)

	$('#filters a').click ->
  		selector = $(this).attr('data-filter')
  		$container.isotope({ filter: selector })
  		return false

	$checkboxes.change ->
		filters = [];
		$checkboxes.filter(':checked').each ->
		  filters.push( this.value )
		filters = filters.join(', ')
		$container.isotope({ filter: filters })

	$('#filters input[type=checkbox]').change ->
	    $(this).next('label').toggleClass('selected')
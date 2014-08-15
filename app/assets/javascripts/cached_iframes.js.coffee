$ ->
  $('#loading').addClass('hidden')
  $('[data-datagroup-dataset-visualization-id]').first().removeClass('hidden')
  $(document).on 'click', '[data-datagroup-dataset-id]', (event) ->
    visualizationId = $(event.currentTarget).data('datagroup-dataset-id')
    $('[data-datagroup-dataset-visualization-id]').addClass('hidden')
    $("[data-datagroup-dataset-visualization-id='" + visualizationId + "']").removeClass('hidden')

$ ->
  $('#loading').addClass('hidden')
  $('[data-dataset-visualization-id]').first().removeClass('hidden')
  $(document).on 'click', '[data-dataset-id]', (event) ->
    datasetId = $(event.currentTarget).data('dataset-id')
    $('[data-dataset-visualization-id]').addClass('hidden')
    $("[data-dataset-visualization-id='" + datasetId + "']").removeClass('hidden')

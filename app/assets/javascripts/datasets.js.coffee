bindDataAccordion = ->
  $(document).on 'click', '#data-group-accordion li', ->
    dataUrl = $(this).data('dataset-url')
    dataId = $(this).data('dataset-id')
    content = undefined

    if _.contains window.hp.cachedVisualizations, dataId
      showCachedVisualization(dataId)
      $('.visualization').hide();
    else
      $('.visualization').html(content);

showCachedVisualization = (dataId) ->
  $('.cached-visualizations').children().hide();
  $('.cached-visualizations').find("[data-dataset-id='" + dataId + "']").first().show();

$ ->
  bindDataAccordion();

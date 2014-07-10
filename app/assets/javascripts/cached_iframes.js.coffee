$.ajax
    url: 'data'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
        cacheVisualizations(data)

cacheVisualizations = (data) -> 
    _(data).forEach (datum) ->
        visualization = datum.visualization_iframe
        visualizationDiv = $('<div>');
        visualizationDiv.attr('data-dataset-id', datum.id)
        visualizationDiv.html(decodeURI(visualization))
        $('.cached-visualizations').append(visualizationDiv)
        window.hp.cachedVisualizations.push(datum.id)

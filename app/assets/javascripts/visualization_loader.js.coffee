visualizationLoader = (rootEl) ->
    cachedVisualizations = []
    $rootEl = $(rootEl)

    cacheVisualizations = (data) -> 
        _(data).forEach (datum) ->
            visualization = datum.visualization_iframe
            visualizationDiv = $('<div>');
            visualizationDiv.attr('data-dataset-id', datum.id)
            visualizationDiv.addClass('visualization')
            visualizationDiv.html(decodeURI(visualization))

            $rootEl.find('.cached-visualizations').append(visualizationDiv)
            cachedVisualizations.push(datum.id)

        window.hp.cachedVisualizations = cachedVisualizations

    loadVisualizations = ->
        $.ajax
            url: 'data'
            dataType: 'json'
            error: (jqXHR, textStatus, errorThrown) ->
                $rootEl.prepend "AJAX Error: #{textStatus}"
            success: (data, textStatus, jqXHR) ->
                cacheVisualizations(data)


    return {
        loadVisualizations: loadVisualizations   
    }

visualizationLoader('#data-browser').loadVisualizations()
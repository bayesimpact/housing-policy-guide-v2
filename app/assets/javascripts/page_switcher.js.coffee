hp.pageSwitcher = (rootEl) ->
    $rootEl = $(rootEl)

    showCachedVisualization = (dataId) ->
        $cachedVisualizations = $rootEl.find('.cached-visualizations')
        $targetVisualization = $cachedVisualizations.find("[data-dataset-id='" + dataId + "']").first()

        $cachedVisualizations.children().hide()
        $targetVisualization.show()

    showUncachedVisualization = (content) ->
        $rootEl.find('.uncached-visualization').html(content).show()

    visualizationCached = (dataId) ->
         _.contains window.hp.cachedVisualizations, dataId

    showVisualization = (data) ->
        dataId = data.id
        content = data.visualization_iframe

        $rootEl.find('.visualization').hide()
        if visualizationCached
            showCachedVisualization(dataId)
        else
            showUncachedVisualization(content)

    renderPage = (data) ->
        showVisualization(data)
        $rootEl.find('.description').text(data.source_description)
        $rootEl.find('.notes').text(data.notes)

    switchPage = (dataId) ->
        $.ajax
            url: '/datasets/' + dataId
            typeType: 'json'
            success: (data, textStatus, jqXHR) ->
                renderPage(data)

    return {
        switchPage: switchPage
    }
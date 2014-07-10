#= require page_switcher

$(document).on 'ready page:load', ->
    pageSwitcher = hp.pageSwitcher($('#data-browser'))
    $('#data-group-accordion').find('li').on 'click', -> 
        dataId = $(this).data('dataset-id')
        pageSwitcher.switchPage(dataId)

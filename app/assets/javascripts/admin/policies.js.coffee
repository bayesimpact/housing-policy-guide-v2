updateImageOnUpload = ->
  $('input[type=filepicker]').on 'change', (event) ->
    imagePreviewContainer = $(event.currentTarget).siblings('.image-preview')
    imageUrl = event.originalEvent.fpfiles[0].url
    imageClippedUrl = imageUrl + '/convert?fit=clip&h=160&w=160'
    imagePreviewContainer.html('<img src="' + imageClippedUrl + '">')
    $('input[type=submit]').attr('value', 'Save (images not yet saved)')

$ ->
  updateImageOnUpload()
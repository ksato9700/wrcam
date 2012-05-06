#
# Copyright 2012 Kenichi Sato
#

class WRCam
  constructor: (@video, @canvas, onended, onstart) ->
    navigator.webkitGetUserMedia "video", (stream)=>
      @video.src = webkitURL.createObjectURL stream
      @video.onerror = ->
        stream.stop()
      stream.onended = onended
    , onended

    onstart()

  snapshot: ->
    console.log @video
    @canvas.width = @video.videoWidth
    @canvas.height = @video.videoHeight
    @canvas.getContext('2d').drawImage(@video, 0, 0)

window.WRCam = WRCam




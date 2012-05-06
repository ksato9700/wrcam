#
# Copyright 2012 Kenichi Sato
#

class WRCam
  constructor: (@video, @canvas, onended, onstart) ->
    navigator.webkitGetUserMedia "video,audio", (stream)=>
      @video.src = webkitURL.createObjectURL stream
      @video.onerror = ->
        stream.stop()
      stream.onended = onended
      @stream = stream
    , onended

    onstart()

  snapshot: ->
    @canvas.width = @video.videoWidth
    @canvas.height = @video.videoHeight
    @canvas.getContext('2d').drawImage(@video, 0, 0)

  # record: (cb)->
  #   @recorder = @stream.record()
  #   cb()

  # stop: (cb)->
  #   @recodrder.getRerordedData (blob)->
  #     console.log blob

window.WRCam = WRCam

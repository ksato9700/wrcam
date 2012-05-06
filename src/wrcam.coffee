#
# Copyright 2012 Kenichi Sato
#

class WRCam
  constructor: (@local_video, @remote_video, @canvas, onended, onstart) ->
    navigator.webkitGetUserMedia "video,audio", (stream)=>
      @local_video.src = webkitURL.createObjectURL stream
      @local_video.onerror = ->
        stream.stop()
      stream.onended = onended
      @stream = stream
      @local = new webkitDeprecatedPeerConnection "STUN stun.l.google.com:19302", (message)=>
        //

      @local.addStream @stream
      @local.onaddstream = (event)->
        @remote_video.src = webkitURL.createObjectURL event.stream
      console.log @local

    , onended

    onstart()

  snapshot: ->
    @canvas.width = @local_video.videoWidth
    @canvas.height = @local_video.videoHeight
    @canvas.getContext('2d').drawImage(@local_video, 0, 0)


  # record: (cb)->
  #   @recorder = @stream.record()
  #   cb()

  # stop: (cb)->
  #   @recodrder.getRerordedData (blob)->
  #     console.log blob

window.WRCam = WRCam

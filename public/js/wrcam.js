// Generated by CoffeeScript 1.3.1
(function() {
  var WRCam;

  WRCam = (function() {

    WRCam.name = 'WRCam';

    function WRCam(video, canvas, onended, onstart) {
      var _this = this;
      this.video = video;
      this.canvas = canvas;
      navigator.webkitGetUserMedia("video,audio", function(stream) {
        _this.video.src = webkitURL.createObjectURL(stream);
        _this.video.onerror = function() {
          return stream.stop();
        };
        stream.onended = onended;
        return _this.stream = stream;
      }, onended);
      onstart();
    }

    WRCam.prototype.snapshot = function() {
      this.canvas.width = this.video.videoWidth;
      this.canvas.height = this.video.videoHeight;
      return this.canvas.getContext('2d').drawImage(this.video, 0, 0);
    };

    return WRCam;

  })();

  window.WRCam = WRCam;

}).call(this);

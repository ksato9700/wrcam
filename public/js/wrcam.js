// Generated by CoffeeScript 1.3.1
(function() {
  var WRCam;

  WRCam = (function() {

    WRCam.name = 'WRCam';

    function WRCam(video, canvas, onended, onstart) {
      var _this = this;
      this.video = video;
      this.canvas = canvas;
      navigator.webkitGetUserMedia("video", function(stream) {
        _this.video.src = webkitURL.createObjectURL(stream);
        _this.video.onerror = function() {
          return stream.stop();
        };
        return stream.onended = onended;
      }, onended);
      onstart();
    }

    WRCam.prototype.snapshot = function() {
      console.log(this.video);
      this.canvas.width = this.video.videoWidth;
      this.canvas.height = this.video.videoHeight;
      return this.canvas.getContext('2d').drawImage(this.video, 0, 0);
    };

    return WRCam;

  })();

  window.WRCam = WRCam;

}).call(this);

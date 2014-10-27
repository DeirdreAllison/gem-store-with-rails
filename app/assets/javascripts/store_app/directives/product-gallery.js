//=require_self
app.directive("productGallery", function() {
  return {
    restrict: "E",
    templateUrl: "product-gallery.html",
    controller: function() {
      this.current = 0;
      this.setCurrent = function(imageNumber){
        this.current = imageNumber || 0;
      };
    },
    controllerAs: "gallery"
  };
});
$(document).ready(function () {
   $(".js-more").on('click', function() {
      var id = $(this).data("id")

      $.get(`/products/${id}/description`, function (data1) {
         $.get(`/products/${id}/inventory`, function (data2) {
            var inv = (data2 === "false" ? "Sold Out" : "Available")
            var output = `${data1} \n ${inv}`
            $(`div#description-${id}`).html(output)
         })
      })
   })
})
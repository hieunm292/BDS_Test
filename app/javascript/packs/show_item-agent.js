$(function () {
  $('#show-tel').on('click', function () {
    var $this = $(this);
    $this.find('span').text($this.data('telephone'));
  });
});

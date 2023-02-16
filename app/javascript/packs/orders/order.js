/* global $*/
$(function() {
  $(document).on('click', '#order_button', function() {
    const checkedValue = $('input:radio[name="address_option"]:checked').val();

    if (checkedValue === '2'){
      const order_postal_code = $('.order_postal_code').val();
      const order_address = $('.order_address').val();
      const order_name = $('.order_name').val();

      if (order_postal_code === "" || order_address === "" || order_name === "") {
        window.alert('選択されていません'); // 選択されていない場合は警告ダイアログを表示
		    return false;  // 送信を中止
      } else {
        return true;
      }
    } else {
      return true;
    }
  })
});
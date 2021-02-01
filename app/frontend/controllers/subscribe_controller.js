import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
    static targets = [ "email"  ]

    add(){
        event.preventDefault();

        // trim是把頭尾空白的地方刪掉的方法。
        let email = this.emailTarget.value.trim();
        let data = new FormData();
        data.append("subscribe[email]", email);

        Rails.ajax({
            url: '/api/v1/subscribe',
            // 在js裡，當key和value一樣時，可以只寫一個。例如下行原本是data: data
            data,
            type: 'POST',
            dataType: 'json',
            // 用arrow function的寫法，才可以成功帶入後面this的功能。
            success: (response) => {
                switch (response.status){
                    case 'ok':
                        alert('完成訂閱！');
                        // 如果已經訂閱，即把那個訂閱輸入框變空白。
                        this.emailTarget.value = '';
                        break;
                    case 'duplicated':
                        alert(`${response.email} 已經訂閱過囉！`);
                        break;
                }
            },
            error: function(err){
                console.log(err);
            }
        });
    }
}
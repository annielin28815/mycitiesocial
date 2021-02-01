import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "template", "link"]

    add_sku(event){
        event.preventDefault();
        // 可以把 NEW_RECORD 換成類似時間序號戳記的東西，也不會侷限幾個規格。
        let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
        // 可以指定在某一個元素的哪一方，安插某一個元素進去。https://developer.mozilla.org/zh-TW/docs/Web/API/Element/insertAdjacentHTML
        this.linkTarget.insertAdjacentHTML('beforebegin', content);

    }

    remove_sku(event){
        event.preventDefault();

        let wrapper = event.target.closest('.nested-fields');
        if (wrapper.dataset.newRecord == 'true'){
            wrapper.remove();
        }else{
            wrapper.querySelector("input[name*='_destroy']").value = 1;
            wrapper.style.display = 'none';
        }

    }
}
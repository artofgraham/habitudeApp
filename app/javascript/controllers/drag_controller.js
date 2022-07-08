import Rails from "@rails/ujs"
import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    //this.element.textContent = "Hello World!"
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      ghostClass: "neutral",
      onEnd: this.end.bind(this)
    })
  }
  end(event){
    //console.log(event)
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: "PATCH",
      data: data
    })
  }
}
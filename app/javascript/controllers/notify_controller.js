import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "user" ]

  connect () {
    document.addEventListener('notify', this.notify)
  }
  
  disconnect () {
    document.removeEventListener('notify', this.notify)
  }
  
  notify = event => {
    const { id, toName, otherId, notifType} = event.detail
    let route
    route = `/matches/${otherID}`
    $(".notifs").append(`
      <div role="alert" aria-live="assertive" aria-atomic="true" class="toast ml-auto mb-4" data-autohide="false">
        <div class="toast-header">
          New ${notifType}
          <small>${new Date().toLocaleTimeString()}</small>
          <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="toast-body">
          <p>New Match Acceptance!</p>
          <a href="${route}"><i class="fa fa-arrow-circle-right"></i> Go</a>
        </div>
      </div>
      `)
      $('.toast').toast({ autohide: false })
      $('.toast').toast('show')
  }
}
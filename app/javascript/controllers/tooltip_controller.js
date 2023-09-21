import { Controller } from "@hotwired/stimulus"
import { computePosition, flip, shift, offset, arrow } from "@floating-ui/dom"

// Connects to data-controller="tooltip"
export default class extends Controller {
  static targets = [ "tool", "tip" ]
  static values = {
    placement: String
  }

  connect() {
    this 
  }

  show() {
    if(!this.hasValidTargets()) return
    this.update();

    this.tipTarget.style['display'] = 'block'
  }

  hide() {
    if(!this.hasValidTargets()) return
    this.tipTarget.style['display'] = 'none'
  }

  update() {
    if(!this.hasValidTargets()) return
    computePosition(this.toolTarget, this.tipTarget, {
      placement: this.hasPlacementValue ? this.placementValue : 'top',
      middleware: [offset(8), flip(), shift({padding: 5})]
    }).then( ({x, y}) => {
      Object.assign(this.tipTarget.style, {
        left: `${x}px`,
        top: `${y}px`,
      });
    });
  }

  hasValidTargets() {
    if(this.hasToolTarget && this.hasTipTarget) {
      return true
    } else {
      return false
    }
  }
}

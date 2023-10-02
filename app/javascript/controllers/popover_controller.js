import { Controller } from "@hotwired/stimulus"
import { computePosition, flip, shift, offset, arrow } from "@floating-ui/dom"

// Connects to data-controller="popover"
export default class extends Controller {
  static targets = ["container", "button", "popover", "arrow" ]
  static values = {
    placement: String
  }

  show() {
    if(!this.hasValidTargets()) return false;

    this.update();

    this.popoverTarget.style['display'] = 'block'
  }


  hide(event) {
    if(!this.hasValidTargets()) return false;

    if(this.containerTarget.contains(event.relatedTarget)){
      return;
    }
    else this.popoverTarget.style['display'] = 'none';
  }


  update() {
    computePosition(this.buttonTarget, this.popoverTarget, {
      placement: this.hasPlacementValue ? this.placementValue : 'top',
      middleware: [
        offset(8),
        flip(),
        shift({padding: 5}),
        arrow({element: this.arrowTarget}),
        ],
    }).then( ({x, y, placement, middlewareData}) => {
      Object.assign(this.popoverTarget.style, {
        left: `${x}px`,
        top: `${y}px`,
      });

      // Arrow styles
      const {x: arrowX, y: arrowY} = middlewareData.arrow;
      const staticSide = {
        top: 'bottom',
        right: 'left',
        bottom: 'top',
        left: 'right',
      }[placement.split('-')[0]];
   
      Object.assign(this.arrowTarget.style, {
        left: arrowX != null ? `${arrowX}px` : '',
        top: arrowY != null ? `${arrowY}px` : '',
        right: '',
        bottom: '',
        [staticSide]: '-4px',
      });
    });


  }

  hasValidTargets() {
    if(this.hasContainerTarget && this.hasPopoverTarget
    && this.hasButtonTarget  && this.hasArrowTarget) {
      return true
    } else {
      console.log("Invalid targets for new-work-btn-controller")
      return false
    }
  }

  connect() {
  }
}

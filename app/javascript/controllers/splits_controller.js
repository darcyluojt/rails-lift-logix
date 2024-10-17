import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="splits"
export default class extends Controller {

  connect() {
    console.log(this.element)
  }

  extra() {
    // this.element.value (2)
    const splits = this.element.value
    let formNumber = document.querySelectorAll('.category').length
    // loop until splits = formNumber

    if (splits > formNumber) {
      // 4(configured by user) > 1 (default value of formNumber)
      const form = document.querySelector('.category').cloneNode(true)
      const difference = splits - formNumber
      // 3 times do
      for (let i = 0; i < difference; i++) {
        form.querySelector('label').innerText = `Split ${formNumber + i + 1}`
        console.log('duplicate form added ${i+1}')
        // not this element, but should find the last category class
        formNumber = document.querySelectorAll('.category').length
        document.querySelectorAll('.category')[formNumber-1].insertAdjacentElement('afterend', form)
      }
    }
    else if (splits < formNumber) {
      // 3 (user changes his mind) < 4 (original user input)
      const forms = document.querySelectorAll('.category')
      const difference = formNumber - splits
      // 1 time do
      for (let i = 0; i < difference; i++) {
        const lastForm = forms[forms.length-1]
        lastForm.remove()
      }
    }

    // check how many category classes queryselectorall => length (1)
    // compare the difference
    //  if this.element.value > length
    // add new form cloneNode(true)
    // else <
    // remove from the bottom starting from length-1
  }
}

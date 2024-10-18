import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="splits"
export default class extends Controller {
  extra() {
    // what user has inputed (also the event is triggered)
    const userInput = this.element.value
    // check how many spilit fields are there
    const formNumber = document.querySelectorAll('.category').length
    // loop until splits = formNumber
    if (userInput > formNumber) {
      // 4(configured by user) > 1 (default value of formNumber)
      const difference = userInput - formNumber
      // 3 times do
      for (let i = 0; i < difference; i++) {
        const form = document.querySelector('.category').cloneNode(true)
        form.querySelector('label').innerText = `Workout ${formNumber + i + 1}: choose your exercise type`
        form.querySelector('select').name = `programme[splits_attributes][${formNumber + i }][category]`
        form.querySelector('select').id = `programme_splits_attributes_${formNumber + i }_category`
        const currentFormNumber = document.querySelectorAll('.category').length
        document.querySelectorAll('.category')[currentFormNumber-1].insertAdjacentElement('afterend', form)
      }
    }
    else if (userInput < formNumber) {
      // 2 (user changes his mind) < 4 (original user input)

      const difference = formNumber - userInput
      console.log(difference)
      // 2 time do
      for (let i = 0; i < difference; i++) {
        const forms = document.querySelectorAll('.category')
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

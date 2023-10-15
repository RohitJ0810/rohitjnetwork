import { LightningElement } from 'lwc';

export default class HelloQuerySelectorDemo extends LightningElement {
    users = ["a","b","c","d"]
    fetchDetailHandler(){
        const elem = this.template.querySelector('h1')
        console.log('elem-->', elem.innerText)
        elem.style.border = "1px solid red"

        const userElements = this.template.querySelectorAll('.name')
        Array.from(userElements).forEach(item=>{
            console.log(item.innerText);
            item.setAttribute("title", item.innerText)
        })

        const childElement = this.template.querySelector('.child')
        childElement.innerHTML = '<p> Hey I am a child element </p>'
    }
}
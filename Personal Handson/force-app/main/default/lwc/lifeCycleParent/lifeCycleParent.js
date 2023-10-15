import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    isChildVisible = false
    constructor(){
        super()
        console.log('Parent constructor called')
    }

    connectedCallback(){
        console.log('Parent connectedCallback called')
    }

    renderedCallback(){
        console.log('Parent rendered callback called')
    }

    handleClick(event){
        this.isChildVisible = !this.isChildVisible
    }

    errorCallback(error, stack){
        console.log(error.message)
        console.log(stack)
    }
}
import { LightningElement, wire } from 'lwc';
import SampleMessageChannel from '@salesforce/messageChannel/SampleMessageChannel__c';
import { MessageContext, publish } from 'lightning/messageService';

export default class LmsComponentA extends LightningElement {
    @wire(MessageContext)
    context

    inputValue
    inputHandler(event){
        this.inputValue = event.target.value
    }

    publishMessage(){
        console.log('inside publish message')
        const message = {
            lmsData:{
                value:this.inputValue
            }
        }
        console.log(message)
        publish(this.context, SampleMessageChannel, message)
    }
}
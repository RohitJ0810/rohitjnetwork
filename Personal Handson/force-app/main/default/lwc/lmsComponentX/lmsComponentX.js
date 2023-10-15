import { LightningElement, wire } from 'lwc';
import SampleMessageChannel from '@salesforce/messageChannel/SampleMessageChannel__c';
import { subscribe, MessageContext, APPLICATION_SCOPE, unsubscribe } from 'lightning/messageService';

export default class LmsComponentX extends LightningElement {
    @wire(MessageContext)
    context
    receivedMessage
    subscription

    connectedCallback(){
        console.log('inside connectedCallback')
        this.subscribeMessage()
    }

    subscribeMessage(){
        console.log('inside subscribe message')
        this.subscription = subscribe(this.context, SampleMessageChannel, (message)=>{this.handleMessage(message)}, {scope:APPLICATION_SCOPE})
    }

    handleMessage(message){
        console.log('inside handle message')
        this.receivedMessage = message.lmsData.value? message.lmsData.value : 'No message published'
    }

    unsubscribeHandler(){
        unsubscribe(this.subscription)
        this.subscription = null
    }
}
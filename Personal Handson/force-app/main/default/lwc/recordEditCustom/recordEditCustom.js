import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordEditCustom extends LightningElement {
    objectName = ACCOUNT_OBJECT
    accName=''

    handleChange(event){
        this.accName = event.target.value
    }

    handleSubmit(event){
        event.preventDefault()
        const inputCmp = this.template.querySelector('lightning-input')
        const inputValue = inputCmp.value
        if(!inputValue.includes('Canada')){
            inputCmp.setCustomValidity('The account name must include Canada')
        }else{
            inputCmp.setCustomValidity("")
            const fields = event.detail.fields
            fields.Name = inputValue
            this.template.querySelector('lightning-record-edit-form').submit(fields)
        }
        inputCmp.reportValidity()
    }

    handleSuccess(event){
        const toastEvent = new ShowToastEvent({
            title:"Account created",
            message:"Record Id " + event.detail.id,
            variant:"success"
        })

        this.dispatchEvent(toastEvent);
    }
}
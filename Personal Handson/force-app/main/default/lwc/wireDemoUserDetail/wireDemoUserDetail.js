import { LightningElement, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import {getRecord} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/User.Name';
import EMAIL_FIELD from '@salesforce/schema/User.Email';

export default class WireDemoUserDetail extends LightningElement {
    userId = Id
    //005Hp00000gwqlnIAA
    userDetail

    @wire(getRecord, {recordId:'$userId', fields:[NAME_FIELD, EMAIL_FIELD]})
    userDetailHandler({data, error}){
        if(data){
            this.userDetail = data.fields
        }else{
            console.log(error)
        }
    }

    @wire(getRecord, {recordId:'$userId', fields:[NAME_FIELD, EMAIL_FIELD]})
    userDetailProperty
}
package com.egco428.ex04_listactivity01

import android.accounts.AuthenticatorDescription

class Course(val id: Int, val title: String, val description: String, val credits: Double){

    override fun toString(): String {
        return title
    }
}

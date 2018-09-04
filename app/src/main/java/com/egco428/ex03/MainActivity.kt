package com.egco428.ex03

import android.app.ListActivity
import android.os.Bundle
import android.widget.ArrayAdapter

class MainActivity : ListActivity() {

    var mobileList = arrayOf("Samsung", "Apple", "Oppo", "HTC", "Asus", "Vivo", "Lenovo", "LG")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_main)
        val adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, mobileList)

        listAdapter = adapter
    }
}

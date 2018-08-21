package com.egco427.ex01

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var check = true
        button.setOnClickListener {
            if(check) {
                check = false
                textView.text = "Mobile Programming"
            } else {
                check = true
                textView.text = "EGCO428"
            }
        }
    }
}

package com.egco427.ex01

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var a = ""
        var b = ""

        button.setOnClickListener {
            a = editText1.text.toString()
            Log.d("Input1", a)

            b= editText2.text.toString()
            Log.d("Input2", b)

            textView.text = (a.toInt() + b.toInt()).toString()
            Log.d("Result", a+b)
        }
    }
}

package com.egco428.ex02

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_detail.*
import android.R.menu
import android.view.Menu
import android.view.View

class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        val bundle = intent.extras
        val inp1: String

        if(bundle != null){
            inp1 = bundle.getString("input1")
            receiveText.text = inp1
            showText.setText(inp1)
        }
    }
    fun backToMain(view: View){
        finish()
    }

}

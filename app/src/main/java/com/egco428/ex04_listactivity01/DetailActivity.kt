package com.egco428.ex04_listactivity01

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_detail.*

class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)
        supportActionBar!!.setDisplayHomeAsUpEnabled(true)
    val bundle = intent.extras
    var courseTitle: String = ""
    var courseDetail: String = ""
        if (bundle != null){
            courseTitle = bundle.getString("cTitle")
            courseDetail = bundle.getString("cDetail")
            titleText.text = courseTitle
            descriptionText.text = courseDetail

            /*val courseTitle = intent.getStringExtra("courseTitle")
            titleText.text = courseTitle

            val courseDesc = intent.getStringExtra("courseDesc")
            descriptionText.text = courseDesc*/
        }


    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_detail, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem?): Boolean {

        val id = item!!.getItemId()
        if(id == android.R.id.home){
            finish()
        }

        return super.onOptionsItemSelected(item)
    }
}

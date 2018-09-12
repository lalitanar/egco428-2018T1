package com.egco428.ex03_2

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.BaseAdapter
import android.widget.ListView
import android.content.Context
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.row_main.view.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val listView = findViewById<ListView>(R.id.mainListView)


        listView.adapter = myCustomAdapter()
        /*listView.setOnItemClickListener { adapterView, view, position, id ->
            val item = adapterView.getItemAtPosition(position) as String
            Toast.makeText(this, "${item} $position", Toast.LENGTH_LONG).show()
        }*/
    }

    private  class myCustomAdapter():BaseAdapter(){
        //private val mContext: Context
        private val names = arrayListOf<String>("Anakin", "Yoda", "Solo", "Sky Walker", "Wookie", "Gorge Lucas", "CTPO", "R2D2","Anakin", "Yoda", "Solo", "Sky Walker", "Wookie", "Gorge Lucas", "CTPO", "R2D2","Anakin", "Yoda", "Solo", "Sky Walker", "Wookie", "Gorge Lucas", "CTPO", "R2D2","Anakin", "Yoda", "Solo", "Sky Walker", "Wookie", "Gorge Lucas", "CTPO", "R2D2")

        /*init {
            mContext = context
        }*/

        override fun getCount(): Int {
            return names.size
        }

        override fun getItemId(position: Int): Long {
            return position.toLong()
        }

        override fun getItem(position: Int): Any {
            return names[position]
        }

        override fun getView(position: Int, convertView: View?, viewGroup: ViewGroup?): View {

            val whiteColor = Color.parseColor("#FFFFFF")
            val greyColor = Color.parseColor("#E0E0E0")
            val rowMain: View

            if (convertView == null) {

                val layoutInflator = LayoutInflater.from(viewGroup!!.context)
                rowMain = layoutInflator.inflate(R.layout.row_main, viewGroup, false)
                val viewHolder = ViewHolder(rowMain.nameText, rowMain.positionText)
                rowMain.tag = viewHolder
            } else {
                rowMain = convertView
            }



            val viewHolder = rowMain.tag as ViewHolder
            viewHolder.nameText.text = names.get(position)
            viewHolder.positionText.text = "Row Number: $position"

            if ((position%2)==1){
                rowMain.setBackgroundColor(greyColor)
            } else {

                rowMain.setBackgroundColor(whiteColor)
            }

            rowMain.setOnClickListener {
                rowMain.animate().setDuration(1500).alpha(0F).withEndAction {
                    names.removeAt(position)
                    notifyDataSetChanged()
                    rowMain.setAlpha(1.0F)
                }
            }

            return rowMain
        }
        private class  ViewHolder(val nameText: TextView, val positionText: TextView)
    }
}

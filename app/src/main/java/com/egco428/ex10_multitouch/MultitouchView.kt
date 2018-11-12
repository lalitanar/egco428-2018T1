package com.egco428.ex10_multitouch

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.PointF
import android.util.SparseArray
import android.view.MotionEvent
import android.view.View

class MultitouchView(context: Context): View(context) {
    private  var activePointers: SparseArray<PointF>? = null

    private var paint: Paint? = null
    private val colors = intArrayOf(Color.BLUE,Color.RED,Color.BLACK, Color.MAGENTA, Color.GREEN, Color.YELLOW, Color.CYAN, Color.GRAY)
    private var textPaint: Paint? = null
    private val SIZE:Float  = 60F

    init {
        activePointers = SparseArray<PointF>()
        paint = Paint(Paint.ANTI_ALIAS_FLAG)
        paint!!.color = Color.BLUE
        paint!!.style = Paint.Style.FILL_AND_STROKE
        textPaint = Paint(Paint.ANTI_ALIAS_FLAG)
        textPaint!!.textSize = 50F

    }

    override fun onTouchEvent(event: MotionEvent?): Boolean {
        // get pointer index from the event object
        val pointerIndex = event!!.actionIndex

        // get pointer ID
        val pointerId = event!!.getPointerId(pointerIndex)

        // get masked (not specific to a pointer) action
        val maskedAction = event!!.actionMasked

        when (maskedAction) {

            MotionEvent.ACTION_DOWN, MotionEvent.ACTION_POINTER_DOWN -> {
                // We have a new pointer. Lets add it to the list of pointers

                val f = PointF()
                f.x = event!!.getX(pointerIndex)
                f.y = event!!.getY(pointerIndex)
                activePointers!!.put(pointerId, f)
            }
            MotionEvent.ACTION_MOVE -> { // a pointer was moved
                val size = event!!.pointerCount
                var i = 0
                while (i < size) {
                    val point = activePointers!!.get(event.getPointerId(i))
                    if (point != null) {
                        point.x = event.getX(i)
                        point.y = event.getY(i)
                    }
                    i++
                }
            }
            MotionEvent.ACTION_UP, MotionEvent.ACTION_POINTER_UP, MotionEvent.ACTION_CANCEL -> {
                activePointers!!.remove(pointerId)
            }
        }
        invalidate()

        return true
    }

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)
        // draw all pointers
        val size = activePointers!!.size()
        var i = 0
        while (i < size) {
            val point = activePointers!!.valueAt(i)
            if (point != null)
                paint!!.color = colors[i % 8]
            canvas!!.drawCircle(point!!.x, point.y, SIZE, paint)
            i++
        }
        canvas!!.drawText("Total pointers: " + activePointers!!.size(), 10F, 40F, textPaint)
    }

}